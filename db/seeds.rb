# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Borne", email: "borne@collective.com", password: "foobar", password_confirmation: "foobar", admin: true)
Forum.create(name: "CSC 440: Software Engineering")
