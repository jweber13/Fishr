# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "destroying database"

Contact.destroy_all
Company.destroy_all
FishingTrip.destroy_all
User.destroy_all

puts "creating user"
puts "email: user@wagon.com"
puts "password: secret"

user = User.create(
  email: "user@wagon.com",
  password: "secret"
)

puts "creating companies and contacts"
10.times do
  company = Company.new(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    description: Faker::Company.bs
  )
  company.website = "#{company.name.gsub(/[ ,.]/, '').downcase}.com"
  company.save

  name = Faker::Movies::StarWars.character
  contact = Contact.new(
    firstname: name.split[0],
    lastname: name.split[1],
    title: Faker::Job.title,
    email: Faker::Internet.email(name: name.split[0], domain: "#{company.name}.com"),
    phone: Faker::PhoneNumber.cell_phone,
    insta: name.split[0],
    linkedin: "linkedin.com/#{name.gsub(' ', '-')}",
    twitter: "@#{name.split[0]}",
    note: Faker::Lorem.paragraph(sentence_count: 5)
  )
  contact.user = user
  contact.company = company
  contact.save
end

puts "created #{Company.count} companies"
puts "created #{Contact.count} contacts"
