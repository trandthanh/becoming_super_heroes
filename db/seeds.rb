# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Track.destroy_all
Wish.destroy_all
Subject.destroy_all

# SUBJECTS

puts 'Creating users ...'
users_attributes = [
  {
    email: 'test1@gmail.com'
    first_name: 'Macadamia 1',
    last_name: 'Test 1',
    zipcode: '75005'
  },
  {
    email: 'test2@gmail.com',
    first_name: 'Macadamia 2',
    last_name: 'Test 2',
    zipcode: '75007'
  },
  {
    email: 'test3@gmail.com',
    first_name: 'Macadamia 3',
    last_name: 'Test 3',
    zipcode: '92340'
  },
  {
    email: 'admin@gmail.com',
    admin: true
  }
]
User.create!(users_attributes)
puts 'Users created!'

puts 'Creating subjects ...'
subjects_attributes = [
  {
    category: 'Tête',
    name: 'Ecriture',
    description: "S'exprimer à l'écrit au travers de nos ateliers"
  },
  {
    category: 'Tête',
    name: 'Peinture',
    description: "Art & Thérapie"
  },
  {
    category: 'Tête',
    name: 'Musique',
    description: "Chant, Guitare, Piano : à vous de choisir !"
  },
  {
    category: 'Corps',
    name: 'Yoga',
    description: '...'
  },
  {
    category: 'Corps',
    name: 'Zumba',
    description: '...'
  },
  {
    category: 'Corps',
    name: 'Tai Chi Chuan',
    description: '...'
  },
  {
    category: 'Corps',
    name: 'Dynamo',
    description: '...'
  }
]
Subject.create!(subjects_attributes)
puts 'Subjects created!'
