# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'Cleaning DB'
User.destroy_all
addresses = ['Rua Rodrigues Sampaio 172, Lisboa', 'Rua Escola do Exército 5A, Lisboa' , 'São Jorge de Arroios, Lisbon', 'Rua João Penha 2-14, Lisboa', 'Rua Damasceno Monteiro 74-152, Lisboa', 'Rua Manuel Soares Guedes 1, Lisboa', "Rua de Sant'Ana à Lapa 2-52, Lisboa", 'Rua do Patrocínio 55-1, Lisboa', 'Rua de Borges Carneiro 57, Lisboa', 'Rua Vítor Cordon 24-40, Lisboa']

p "Adding users"

User.create!(first_name: 'Flavia', last_name: 'Muntean', email: 'flavia@abc.com', password: 'abcd123', bio: Faker::Lorem.paragraphs.join(" "), address: addresses.sample, age: 28)
User.create!(first_name: 'Bruno', last_name: 'Nery', email: 'bruno@abc.com', password: 'abcd123', bio: Faker::Lorem.paragraphs.join(" "), address: addresses.sample, age: 30)
User.create!(first_name: 'Tiago', last_name: 'Alexandre Vaz Faria', email: 'tiago@abc.com', password: 'abcd123', bio: Faker::Lorem.paragraphs.join(" "), address: addresses.sample, age: 25)
User.create!(first_name: 'Pietro', last_name: 'Dalla Vecchia', email: 'pietro@abc.com', password: 'abcd123', bio: Faker::Lorem.paragraphs.join(" "), address: addresses.sample, age: 29)

5.times do
  User.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, bio: Faker::Lorem.paragraphs.join(" "), address: addresses.sample, email: Faker::Internet.unique.email, password: Faker::Alphanumeric.alphanumeric(number: 10), age: (18..55).to_a.sample)
end

# video_links = ["https://www.youtube.com/watch?v=xJjYIOgs1DA", "https://www.youtube.com/watch?v=nlk5GfvDbzY", "https://www.youtube.com/watch?v=OZCfqhRgJ0Q"]


# users = User.all

p "Users added"
