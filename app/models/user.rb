class User < ApplicationRecord
  has_secure_password
  has_many :status_changes
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
