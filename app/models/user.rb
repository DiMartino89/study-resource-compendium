class User < ApplicationRecord
  has_many:resources
  validates :name, presence: true, uniqueness: true
  has_secure_password
end
