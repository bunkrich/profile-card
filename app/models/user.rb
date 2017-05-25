class User < ActiveRecord::Base
  validates :email, :google_sheets_code, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :email, format: { with: /[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+/ }
  # validates :google_sheets_code, format: { with: /spreadsheets\/d\/.+/ }

  has_secure_password
end
