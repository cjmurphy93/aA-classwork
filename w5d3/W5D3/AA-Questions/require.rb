require_relative "questions_database.rb"
require_relative 'questions'
require_relative 'replies'
require_relative 'question_likes'
require_relative 'question_follows.rb'
require_relative 'users.rb'


q = Question.find_by_id(1)
p QuestionFollow.most_followed_questions(5)
