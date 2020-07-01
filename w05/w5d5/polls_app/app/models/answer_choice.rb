class AnswerChoice < ApplicatonRecord

    belongs_to :question,
        class_name: :Question,
        foreign_key: :question_id,
        primary_key: :id

    has_many :responses
        class
end