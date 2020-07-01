# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord   #V
    validates :user_name, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: { message: 'Password can\'t be blank' }
    validates :password, length: {minimum: 6, allow_nil: true}
    after_initialize :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(user_name, password)      #F
       
        user = User.find_by(user_name: user_name)
        return user if user && user.is_password?(password)
        nil
    end

    def self.generate_session_token    #G
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!         #R
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)    #P
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token   #E
        self.session_token ||= self.class.generate_session_token
    end

    def is_password?(password)  #I
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end


end

# session token in your cookie matches a session token in our users table User model auth methods: 

# FIG VAPER

# find_by_credentials
# is_password?
# generate_session_token
# validations
# attr_reader
# password=
# ensure_session_token
