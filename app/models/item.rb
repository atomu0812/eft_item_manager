class Item < ApplicationRecord
  has_many :user_items, dependent: :destroy
  has_many :users, through: :user_items
  has_many :item_tasks, dependent: :destroy
  has_many :tasks, through: :item_tasks
  has_many :item_hideouts, dependent: :destroy
  has_many :hideouts, through: :item_hideouts

  validates :name, presence: true, uniqueness: true

  scope :search_by_name, lambda { |keyword|
    if keyword.present?
      where("name LIKE ?", "%#{sanitize_sql_like(keyword)}%")
    else
      all
    end
  }

  def task_required_quantity
    item_tasks.sum(:required_quantity)
  end

  def hideout_required_quantity
    item_hideouts.sum(:required_quantity)
  end

  def total_required_quantity
    task_required_quantity + hideout_required_quantity
  end

  def usage_labels
    labels = []
    labels << "タスク" if item_tasks.exists?
    labels << "ハイドアウト" if item_hideouts.exists?
    labels
  end

  def task_required_quantity_up_to_level(level)
    item_tasks.joins(:task).where(tasks: { level: ..level }).sum(:required_quantity)
  end

  def total_required_quantity_up_to_level(level)
    task_required_quantity_up_to_level(level) + hideout_required_quantity
  end

  def related_task_names_up_to_level(level = nil)
    scope = tasks.distinct.order(:name)
    scope = scope.where(level: ..level) if level.present?
    scope.pluck(:name)
  end

  def related_hideout_names
    hideouts.distinct.order(:name).pluck(:name)
  end

  def usage_detail_text(level = nil)
    names = related_task_names_up_to_level(level) + related_hideout_names
    names.uniq.join(", ")
  end
end