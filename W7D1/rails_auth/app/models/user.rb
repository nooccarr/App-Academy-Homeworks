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
    before_validation :ensure_session_token

    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: { message: "Password can't be blank" }
    validates :password, length: { minimum: 6 }, allow_nil: true

    attr_reader :password       # for validation to occur

    def self.find_by_credentials(username, password)
        debugger
        user = User.find_by(username: username)     # returns either matching user or nil
        bcrypt_pw = BCrypt::Password.new(user.password_digest)   # converts user[password_digest] to bcrypt

        # if matching username value is found && converted bcrypt matches argument(password)
        if user && bcrypt_pw.is_password?(password) 
            return user
        end

        nil
    end
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(password)
        @password = password    # set @password equal to argument for appropriate validation
        self.password_digest = BCrypt::Password.create(password)
    end

end
