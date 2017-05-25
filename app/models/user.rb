class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+/ }

  has_secure_password
end
