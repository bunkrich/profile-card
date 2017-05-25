require 'faker'

100.times do
  Bumblebee.create(job: Faker::Company.profession, name: Faker::GameOfThrones.character)
end