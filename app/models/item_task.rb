class ItemTask < ApplicationRecord
  belongs_to :item
  belongs_to :task

  validates :required_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :item_id, uniqueness: { scope: :task_id }
end
