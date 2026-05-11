class Task < ApplicationRecord
  has_many :item_tasks, dependent: :destroy
  has_many :items, through: :item_tasks

  validates :name, presence: true, uniqueness: true
  validates :trader, presence: true
  validates :level, presence: true, numericality: { only_integer: true, greater_than: 0 }
end