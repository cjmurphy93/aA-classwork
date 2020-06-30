# require_relative "questions_database.rb"

class QuestionFollow
     attr_accessor :user_id, :question_id

    def self.find_by_id(id)
     question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        return nil unless question_follows.length > 0
        QuestionFollow.new(question_follows.first)
    end
    
    def self.followers_for_question_id(question_id)
        user_ids = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                users.id, lname, fname
            FROM
                question_follows
                
            JOIN users ON user_id = users.id

            WHERE
                question_id = ?
        SQL
        return nil unless user_ids.length > 0
        user_ids.map {|user_id| User.new(user_id)}
    end

    def self.followed_questions_for_user_id(users_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, users_id)
            SELECT
                questions.id, title, body, questions.user_id
            FROM
                questions
                
            JOIN question_follows ON question_id = questions.id

            WHERE
                questions.user_id = ?
        SQL
        return nil unless questions.length > 0
        questions.map {|question| Question.new(question)}
    end

    def self.most_followed_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
               questions.id, title, body, questions.user_id
            FROM
                question_follows

            JOIN questions ON question_id = questions.id
            GROUP BY 
                questions.id
            ORDER BY
                SUM(question_follows.id)
            LIMIT ?
        SQL
        return nil unless questions.length > 0
        questions.map {|user_id| Question.new(user_id)}
    end


    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end
    
end

# p QuestionFollow.find_by_id(1)