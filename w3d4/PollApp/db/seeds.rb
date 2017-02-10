# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# rake db:drop
# rake db:create
# rake db:migrate

u1 = User.create!(name: 'a')
u2 = User.create!(name: 'b')
u3 = User.create!(name: 'c')

p1 = Poll.create!(title: 'Who are you voting for1?', user_id: u1.id)
p2 = Poll.create!(title: 'Who are you voting for2?', user_id: u2.id)
p3 = Poll.create!(title: 'Who are you voting for3?', user_id: u3.id)

q1 = Question.create!(text: 'one', poll_id: p1.id)
q2 = Question.create!(text: 'four', poll_id: p2.id)
q3 = Question.create!(text: 'five', poll_id: p2.id)
q4 = Question.create!(text: 'three', poll_id: p3.id)

question = q1
t1 = AnswerChoice.create!(text: 'A', question_id: question.id)
t2 = AnswerChoice.create!(text: 'B', question_id: question.id)
t3 = AnswerChoice.create!(text: 'C', question_id: question.id)

question = q2
t4 = AnswerChoice.create!(text: 'A', question_id: question.id)
t5 = AnswerChoice.create!(text: 'B', question_id: question.id)
t6 = AnswerChoice.create!(text: 'C', question_id: question.id)

question = q3
t7 = AnswerChoice.create!(text: 'A', question_id: question.id)
t8 = AnswerChoice.create!(text: 'B', question_id: question.id)
t9 = AnswerChoice.create!(text: 'C', question_id: question.id)

question = q4
t10 = AnswerChoice.create!(text: 'A', question_id: question.id)
t11 = AnswerChoice.create!(text: 'B', question_id: question.id)
t12 = AnswerChoice.create!(text: 'C', question_id: question.id)

# user 1 answers poll1
r1 = Response.create!(user_id: u1.id, answer_choice_id: t1.id)

# user1 answers poll2
r2 = Response.create!(user_id: u1.id, answer_choice_id: t4.id)
r3 = Response.create!(user_id: u1.id, answer_choice_id: t9.id)

# user1 takes poll3
r4 = Response.create!(user_id: u1.id, answer_choice_id: t11.id)

#user2 takes polls 1 + 3
r5 = Response.create!(user_id: u2.id, answer_choice_id: t2.id)
r6 = Response.create!(user_id: u2.id, answer_choice_id: t12.id)

#user3 takes poll3
r7 = Response.create!(user_id: u3.id, answer_choice_id: t12.id)

#poll_1,  2 times
#poll_2  once
#poll3   3 times
