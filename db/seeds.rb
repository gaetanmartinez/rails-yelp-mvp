# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Destroy all restaurants'
Restaurant.destroy_all
puts 'Done'

puts 'Destroy all review'
Review.destroy_all
puts 'Done'

puts 'Creating restaurant'
resto1 = Restaurant.create(name: 'Lentrecote', address: 'Toulouse', category: 'italian', phone_number: '0097876665')
resto2 = Restaurant.create(name: 'Shin Ya Ramen', address: 'Castres', category: 'chinese', phone_number: '0767876665')
resto3 = Restaurant.create(name: 'Meet the meat', address: 'Bordeaux', category: 'french', phone_number: '0697876665')
puts 'created restaurant'

puts 'creating reviews'
Review.create!(content: 'Super restaurant je recommande', rating: 4, restaurant_id: resto1.id)
Review.create!(content: 'Trop bon!', rating: 4, restaurant_id: resto2.id)
Review.create!(content: 'Woaouh expérience de fou', rating: 3, restaurant_id: resto3.id)
puts 'finish created reviews'
