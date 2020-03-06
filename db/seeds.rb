# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Veterinarian.create(name: 'Cat Doctor', email: 'catdr@email.com', password: 'password', admin: "false")
Veterinarian.create(name: 'Dog Doctor', email: 'dogdr@email.com', password: 'password', admin: "false")
Veterinarian.create(name: 'Bird Doctor', email: 'birddr@email.com', password: 'password', admin: "false")
Veterinarian.create(name: 'horse Doctor', email: 'horsedr@email.com', password: 'password', admin: "false")