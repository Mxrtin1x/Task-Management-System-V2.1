
class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Custom validation for password length
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  private

  def password_required?
    new_record? || password.present?
  end
end
