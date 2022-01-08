# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
r1 = Role.create({ name: 'Admin', description: '' })
r2 = Role.create({ name: 'Seller', description: '' })

u1 = User.create({ name: 'Test_user', email: 'test@example.com', password: 'qwerty', password_confirmation: 'qwerty', role_id: r1.id })
u2 = User.create({ name: 'Test_user2', email: 'test2@example.com', password: 'qwerty', password_confirmation: 'qwerty', role_id: r2.id })

p1 = Post.create({ title: 'Test1', description: 'Test!', user_id: u1.id })
p2 = Post.create({ title: 'Test2', description: 'Test2',  user_id: u2.id })

Tag.create(name: "Recipe")
Tag.create(name: "Travel")
Tag.create(name: "Fashion/Beauty")
Tag.create(name: "Humour")