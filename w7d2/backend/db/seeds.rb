# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Todo.destroy_all
t1 = Todo.create(title: "walk the dog", body: "blah", done: false)
t2 = Todo.create(title: "walk the cat", body: "blah cat", done: false)
Todo.create(title: "go to moon", body: "blah", done: true)

Step.destroy_all
Step.create(title: "step 1", description: "bladd", done: false, todo_id: t1.id)
Step.create(title: "step 2", description: "blafsdfsdd", done: false, todo_id: t1.id)

Step.create(title: "step 1", description: "different text", done: true, todo_id: t2.id)
