class Item < ApplicationRecord
  has_many :user_items, dependent: :destroy
  has_many :users, through: :user_items

  validates :name, presence: true
  validates :required_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end