class Item < ApplicationRecord
  has_many :user_items, dependent: :destroy
  has_many :users, through: :user_items
  has_many :item_tasks, dependent: :destroy
  has_many :tasks, through: :item_tasks
  has_many :item_hideouts, dependent: :destroy
  has_many :hideouts, through: :item_hideouts

  validates :name, presence: true
  validates :required_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :search_by_name, lambda { |keyword|
    if keyword.present?
      where("name LIKE ?", "%#{sanitize_sql_like(keyword)}%")
    else
      all
    end
  }
end