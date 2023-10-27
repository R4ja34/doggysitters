# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

city_names = ["Paris", "Marseille", "Toulouse", "Montpellier"]

city_names.each do |name|
  City.create(name: name)
end

25.times do
  dog = Dog.create(
    name: Faker::Creature::Dog.breed,
    city_id: City.all.sample.id
  )
end

10.times do
  dogsitter = Dogsitter.create(
    name: Faker::Name.first_name,
    city_id: City.all.sample.id
  )
end

dogsitters = Dogsitter.all
dog = Dog.all

30.times do
  dogsitter = Dogsitter.all.sample  # Sélectionnez un dogsitter aléatoire parmi tous les existants
  city = City.find(dogsitter.city_id)
  dogs_in_same_city = Dog.where(city_id: city.id)
  date = Faker::Time.between_dates(from: Date.today, to: 1.year.from_now, period: :all)
  num_dogs = rand(3..6)
  dogs_to_walk = dogs_in_same_city.sample(num_dogs)
  dogs_to_walk.each do |dog|
    Stroll.create(date: date, dogsitter: dogsitter, dog: dog, city: city)
  end
end

# dogsitter_id = 4
# strolls = Stroll.where(dogsitter_id: dogsitter_id)