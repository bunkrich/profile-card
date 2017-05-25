class Bumblebee < ActiveRecord::Base
  # Remember to create a migration!
  validates :job, presence: true
end
