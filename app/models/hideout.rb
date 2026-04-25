class Hideout < ApplicationRecord
  has_many :item_hideouts, dependent: :destroy
  has_many :items, through: :item_hideouts

  validates :name, presence: true, uniqueness: true
end
