# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
c1 = Category.create(name: "Git", description: "Version control")
c2 = Category.create(name: "Ruby", description: "Object Oriented Programming language")
User.delete_all
u1 = User.create(name: "Martin", email: "test@test.com", password: "test", password_confirmation: "test")
u2 = User.create(name: "Timo", email: "test2@test.com", password: "test", password_confirmation: "test")
Resource.delete_all
c1.resources.create(name: "GitHub", description: "How people build software", link: "https://github.com/", last_modified: Date.today, owner_id: u1.id, score: 0)
c2.resources.create(name: "RubyOnRails", description: "Imagine what you could build if you learned Ruby on Rails...", link: "http://rubyonrails.org/", last_modified: Date.today, owner_id: u2.id, score: 0)


