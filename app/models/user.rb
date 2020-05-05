class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :email,
    presence: true, 
    uniqueness: true, 
    format: VALID_EMAIL_REGEX

end
