class Item < ApplicationRecord
  has_many :user_items, dependent: :destroy
  has_many :users, through: :user_items

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