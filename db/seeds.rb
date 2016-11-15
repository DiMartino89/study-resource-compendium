# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Category.create(name: "Git", description: "Version control")
Category.create(name: "Ruby", description: "Object Oriented Programming language")
User.delete_all
User.create(name: "Martin", email: "test@test.com", password_digest: "test")
User.create(name: "Timo", email: "test2@test.com", password_digest: "test")
Resource.delete_all
Resource.create(name: "GitHub", description: "How people build software", category_id: Category.where(name: "Git").first, last_modified: Date.today, owner_id: User.where(name: "Martin").first, score: 0)
Resource.create(name: "RubyOnRails", description: "Imagine what you could build if you learned Ruby on Rails...", category_id: Category.where(name: "Ruby").first, last_modified: Date.today, owner_id: User.where(name: "Timo").first, score: 0)


