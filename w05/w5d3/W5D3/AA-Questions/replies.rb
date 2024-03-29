# require_relative "questions_database.rb"
require 'byebug'

class Reply
     attr_accessor :id, :question_id, :parent_id, :user_id, :body

    def self.find_by_id(id)
     replies = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        return nil unless replies.length > 0
        Reply.new(replies.first)
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @user_id = options['user_id']
        @body = options['body']
    end

    def self.find_by_user_id(user_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
        *
        FROM
        replies
        WHERE
        user_id = ?
        SQL
        return nil unless replies.length > 0
        # replies.select! {|reply| reply}
        #debugger
        replies.map {|reply| Reply.new(reply)}
    end

    def self.find_by_question(question_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
        *
        FROM
        replies
        WHERE
        question_id = ?
        SQL
        # debugger
        return nil unless replies.length > 0
        replies.map {|reply| Reply.new(reply)}
    end

    def author
        User.find_by_id(@user_id)
    end

    def question 
        Question.find_by_id(@question_id)
    end

    def parent_reply 
        Reply.find_by_id(@parent_id)
    end

    def child_replies
        replies = QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT
            *
            FROM
            replies
            WHERE 
            parent_id = ?
        SQL
        # debugger
        return nil unless replies.length > 0
        replies.map {|reply| Reply.new(reply)}
    end


end

# p Reply.find_by_id(1)