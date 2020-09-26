class User < ApplicationRecord
    has_many :characters
    has_many :campaigns, through: :characters

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

    validates :user_name, :email, presence: true
    validates :user_name, :email, uniqueness: true
    validates :user_name, length: { minimum: 3, maximum: 25 }
    validates :email, length: { minimum: 10, maximum: 200 }, format: { with: VALID_EMAIL_REGEX }
end
