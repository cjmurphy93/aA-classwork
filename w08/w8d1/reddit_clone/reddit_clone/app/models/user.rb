# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

    attr_reader :password

    after_initialize :ensure_session_token

    has_many :posts,
      primary_key: :id, 
      foreign_key: :author_id, 
      class_name: :Post

    has_many :moderated_subs,
      primary_key: :id, 
      foreign_key: :moderator_id,
      class_name: :Sub

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        return nil unless user && user.is_password?(password)
        user
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    private

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end


end
