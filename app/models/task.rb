class Task < ApplicationRecord
  has_many :item_tasks, dependent: :destroy
  has_many :items, through: :item_tasks

  validates :name, presence: true, uniqueness: true
end
