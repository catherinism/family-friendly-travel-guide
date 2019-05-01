# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fkahlo = User.create(name: "Frida", username: "fkahlo", password: "password")

monet = User.create(name: "Monet", username: "monet", password: "password")

#create guides

Guide.create(location: "London", summary: "Awesome place", user_id: fkahlo.id)

#preassociate data

fkahlo.guides.create(location: "Dubai")

monet_guide = monet.guides.build(location: "Canada")
monet_guide.save
