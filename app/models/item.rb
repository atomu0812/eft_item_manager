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
end