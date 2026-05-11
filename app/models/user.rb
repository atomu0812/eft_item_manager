class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_items, dependent: :destroy
  has_many :items, through: :user_items
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks
end