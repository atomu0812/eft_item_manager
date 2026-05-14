require "securerandom"

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_items, dependent: :destroy
  has_many :items, through: :user_items
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks

  def self.guest
    create!(
      email: "guest_#{Time.current.to_i}_#{SecureRandom.hex(8)}@example.com",
      password: SecureRandom.urlsafe_base64,
      guest: true
    )
  end

  def display_name
    guest? ? "ゲストユーザー" : email
  end
end