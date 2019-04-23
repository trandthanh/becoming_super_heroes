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
