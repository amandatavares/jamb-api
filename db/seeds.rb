# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
include Faker

Student.destroy_all

3.times do
    Student.create([{
       imageUrl: 'https://www.koty.pl/wp-content/uploads/2018/03/28433855_1616057341844746_1624119600692068352_n-200x133.jpg',
       name: Faker::Name.first_name,
       university: 'IFCE Fortaleza',
       major: 'Engenharia da Computacao',
       area: 'Tecnologia',
       startDate: '2017.1',
       job: Faker::Company.name,
       phone: Faker::PhoneNumber.phone_number,
       email: Faker::Internet.email,
       password: 'teste'
    }])
end

p "Created #{Student.count} students"
