# require_relative "questions_database.rb"
require 'byebug'

class Question
    attr_accessor :id, :title, :body, :user_id

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless question.length > 0
        Question.new(question.first)
    end

      def followers
        QuestionFollow.followers_for_question_id(self.id)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def self.find_by_author_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                questions
            WHERE
                user_id = ?
        SQL
        # debugger
        return nil unless questions.length > 0
        questions.map {|question| Question.new(question)}
    end

    def replies
        Reply.find_by_question(self.id)
    end

    def author
        @user_id
    end

end

q = Question.find_by_id(2)
# p q.replies