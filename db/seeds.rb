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
Mentee.destroy_all
Mentor.destroy_all


# USERS

puts 'Creating users ...'
users_attributes = [
  {
    email: 'obiwan.kenobi@gmail.com',
    first_name: 'Obiwan',
    last_name: 'Kenobi',
    zipcode: '75005',
    password: '123456',
    age: 25,
    hospital: 'Institut Curie',
    sickness: 'Cancer du Sein',
    hobby_head: 'Ecriture',
    hobby_body: 'Zumba'
  },
  {
    email: 'anakin.skywalker@gmail.com',
    first_name: 'Anakin',
    last_name: 'Skywalker',
    zipcode: '75007',
    password: '123456',
    age: 30,
    hospital: 'Saint-Louis',
    sickness: 'Cancer du Sein',
    hobby_head: 'Ecriture',
    hobby_body: 'Yoga'
  },
  {
    email: 'kylo.ren@gmail.com',
    first_name: 'Kylo',
    last_name: 'Ren',
    zipcode: '92340',
    password: '123456',
    age: 30,
    hospital: 'Saint-Louis',
    sickness: 'Leucémie',
    hobby_head: 'Ecriture',
    hobby_body: 'Yoga'
  },
  {
    email: 'R2D2@gmail.com',
    first_name: 'R2D2',
    last_name: 'Bot',
    zipcode: '75019',
    password: '123456',
    age: 27,
    hospital: 'Pitié Salpétrière',
    sickness: 'Cancer des Ovaires',
    hobby_head: 'Ecriture',
    hobby_body: 'Zumba'
  },
  {
    email: 'leia.organa@gmail.com',
    first_name: 'Leia',
    last_name: 'Organa',
    zipcode: '69002',
    password: '123456',
    age: 27,
    hospital: 'Léon Bérard',
    sickness: 'Cancer du Sein',
    hobby_head: 'Peinture',
    hobby_body: 'Zumba'
  },
  {
    email: 'han.solo@gmail.com',
    first_name: 'Han',
    last_name: 'Solo',
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

obiwan = User.find_by(email: 'obiwan.kenobi@gmail.com')
anakin = User.find_by(email: 'anakin.skywalker@gmail.com')
kylo = User.find_by(email: 'kylo.ren@gmail.com')
leia = User.find_by(email: 'leia.organa@gmail.com')
han = User.find_by(email: 'han.solo@gmail.com')
R2D2 = User.find_by(email: 'R2D2@gmail.com')

# MENTORS

puts 'Creating mentors...'
3.times do
  Mentor.create
end
puts 'Mentors created'

m1 = Mentor.first
m2 = Mentor.second
m3 = Mentor.last

puts 'Linking mentors and users...'
obiwan.mentor = m1
obiwan.save
anakin.mentor = m2
anakin.save
kylo.mentor = m3
kylo.save
puts 'Linking mentors and users done!'


# MENTEES

puts 'Creating mentees...'
5.times do
  Mentee.create
end
puts 'Mentees created!'

me1 = Mentee.first
me2 = Mentee.second
me3 = Mentee.third
me4 = Mentee.fourth

puts 'Linking mentees and users...'
obiwan.mentee = me2
obiwan.save
anakin.mentee = me1
kylo.mentee = me3
kylo.save
leia.mentee = me4
leia.save
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

ecriture = Subject.find_by(name: 'Ecriture')
peinture = Subject.find_by(name: 'Peinture')
yoga = Subject.find_by(name: 'Yoga')
zumba = Subject.find_by(name: 'Zumba')

puts 'Creating parcours ...'
wishes_attributes = [
  {
    user: leia,
    status: "Nouveau",
    wish_head: "Avez-vous l'option Théâtre ?"
  },
  {
    user: anakin,
    status: "En cours d'organisation",
    wish_body: "Taekwendo possible ?"
  },
  {
    user: han,
    status: "Nouveau"
  }
]
Wish.create!(wishes_attributes)

w1 = Wish.first
w2 = Wish.second
w3 = Wish.third

tracks_attributes = [
  {
    wish: w1,
    subject: peinture
  },
  {
    wish: w1,
    subject: yoga
  },
  {
    wish: w2,
    subject: peinture
  },
  {
    wish: w3,
    subject: zumba
  },
  {
    wish: w3,
    subject: peinture
  },
  {
    wish: w3,
    subject: yoga
  }
]
Track.create!(tracks_attributes)
puts 'Parcours created!'


