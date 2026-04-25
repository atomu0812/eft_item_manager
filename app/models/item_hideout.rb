class ItemHideout < ApplicationRecord
  belongs_to :item
  belongs_to :hideout

  validates :required_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :item_id, uniqueness: { scope: :hideout_id }
end
