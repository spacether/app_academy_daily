require_relative 'user'
require_relative 'question'
require_relative 'question_follows'
require_relative 'replie'
require_relative 'question_like'


# EASY
# p Question.find_by_author_id(1)
# p Replie.find_by_user_id(1)
# p Replie.find_by_question_id(2)
# p User.find_by_name('Mike', 'Cleary')
# p User.all[1].authored_questions
# p User.all.first.authored_replies
# p Question.all.first.author
# p Question.all.first.replies
# p Replie.all.first.author
# p Replie.all.first.question
# p Replie.all[3].parent_reply
# p Replie.all.first
# p Replie.all.first.child_replies
#
# MEDIUM
# p QuestionFollows.followers_for_question_id(2)
# p QuestionFollows.followed_questions_for_user_id(3)
# p User.all.last.followed_questions
# p Question.all.first.followers

# HARD
# p QuestionFollows.most_followed_questions(3)
# p Question.most_followed(3)
# p QuestionLike.likers_for_question_id(4)
# p QuestionLike.num_likes_for_question_id(3)
# p QuestionLike.liked_questions_for_user_id(4)

# p Question.all[0].likers
# p Question.all[0].num_likes
# p User.all[2].liked_questions

# p QuestionLike.most_liked_questions(2)
# p Question.most_liked(3)

# p User.all[2].average_karma

# User#Save tests
# user = User.new('fname' => 'Jane', 'lname' => 'Doe')
# p user
# user.save
# # p user
# me = User.all.first
# p me
# me.lname = 'Smith'
# p me
# me.save
# p me

# Replie#where
#p Replie.where("body LIKE '%on%' ")
