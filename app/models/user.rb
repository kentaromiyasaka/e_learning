class User < ApplicationRecord
  has_secure_password
  validates :password,length:{ minimum:6 },allow_nil: true
  validates :name, presence: true
  validates :email, presence: true
end