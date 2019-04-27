# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
User.destroy_all
Track.destroy_all
Wish.destroy_all
Subject.destroy_all
Mentor.destroy_all
Mentee.destroy_all


# USERS

puts 'Creating users ...'
users_attributes = [
  {
    email: 'test1@gmail.com',
    first_name: 'Macadamia 1',
    last_name: 'Test 1',
    zipcode: '75005',
    password: '123456',
    age: 25,
    hospital: 'Institut Curie',
    sickness: 'Cancer du Sein',
    hobby_head: 'Ecriture',
    hobby_body: 'Zumba'
  },
  {
    email: 'test2@gmail.com',
    first_name: 'Macadamia 2',
    last_name: 'Test 2',
    zipcode: '75007',
    password: '123456',
    age: 30,
    hospital: 'Saint-Louis',
    sickness: 'Cancer du Sein',
    hobby_head: 'Ecriture',
    hobby_body: 'Yoga'
  },
  {
    email: 'test3@gmail.com',
    first_name: 'Macadamia 3',
    last_name: 'Test 3',
    zipcode: '92340',
    password: '123456',
    age: 30,
    hospital: 'Saint-Louis',
    sickness: 'Leucémie',
    hobby_head: 'Ecriture',
    hobby_body: 'Yoga'
  },
  {
    email: 'test4@gmail.com',
    first_name: 'Macadamia 4',
    last_name: 'Test 4',
    zipcode: '75019',
    password: '123456',
    age: 27,
    hospital: 'Pitié Salpétrière',
    sickness: 'Cancer des Ovaires',
    hobby_head: 'Ecriture',
    hobby_body: 'Zumba'
  },
  {
    email: 'test5@gmail.com',
    first_name: 'Macadamia 5',
    last_name: 'Test 5',
    zipcode: '69002',
    password: '123456',
    age: 27,
    hospital: 'Léon Bérard',
    sickness: 'Cancer du Sein',
    hobby_head: 'Peinture',
    hobby_body: 'Zumba'
  },
  {
    email: 'test6@gmail.com',
    first_name: 'Macadamia 6',
    last_name: 'Test 6',
    zipcode: '69006',
    password: '123456',
    age: 27,
    hospital: 'Léon Bérard',
    sickness: 'Leucémie',
    hobby_head: 'Peinture',
    hobby_body: 'Zumba'
  },
  {
    email: 'admin@gmail.com',
    admin: true,
    password: '123456'
  }
]
User.create!(users_attributes)
puts 'Users created!'


# MENTORS

puts 'Creating mentors...'
6.times do
  Mentor.create
end
puts 'Mentors created'

puts 'Linking mentors and users...'
m = 0
User.all.each do |user|
  mentors = Mentor.all
  user.mentor = mentors[m]
  user.save
  m += 1
end
puts 'Linking mentors and users done!'


# MENTEES

puts 'Creating mentees...'
6.times do
  Mentee.create
end
puts 'Mentees created!'

puts 'Linking mentees and users...'
m = 0
User.all.each do |user|
  mentees = Mentee.all
  user.mentee = mentees[m]
  user.save
  m += 1
end
puts 'Linking mentees and users done!'


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
