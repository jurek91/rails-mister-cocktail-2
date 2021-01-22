require 'httparty'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

puts "Creating Delicious Ingredients"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_list = HTTParty.get(url)

ingredients_list = drinks_list["drinks"]

ingredients_list.each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

puts "Created :)"



# require 'open-uri'
# require 'json'
# class Ingredient
#   def initialize(name)
#     @name = name
#   end
# end
# class IngredientList
#   def initialize
#     @ingredients = []
#   end
#   def all
#     @ingredients
#   end
#   def add(ingredient)
#     @ingredients << ingredient
#   end
# end
# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# doc = open(url).read
# results = JSON.parse(doc) # currently a hash
# ingredients_list = results["drinks"] # array now
# ingredients_repo = IngredientList.new # initialize list
# ingredients_list.each do |ingredient|
#   # Ingredient.create!(name: ingredient["strIngredient1"])
#   ingredients_repo.add(Ingredient.new(ingredient["strIngredient1"]))
# end
# p ingredients_repo.all
