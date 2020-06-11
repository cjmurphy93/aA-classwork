# require_relative "questions_database.rb"


class User
    attr_accessor :id, :lname, :fname

    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless user.length > 0
        User.new(user.first)
    end

    def initialize(options)
        @id = options['id']
        @lname = options['lname']
        @fname = options['fname']
    
    end

    def self.find_by_name(fname, lname)
        name = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
            *
            FROM
            users
            WHERE
            fname = ? AND lname = ?
        SQL
        return nil unless name.length > 0
        User.new(name.first)
    end

    def authored_questions
        Question.find_by_author_id(self.id)
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(self.id)
    end
end

# u = User.find_by_id(2)
# p u.authored_replies