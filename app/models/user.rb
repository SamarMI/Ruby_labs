class User < ApplicationRecord
  has_many :articles
  has_secure_password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
