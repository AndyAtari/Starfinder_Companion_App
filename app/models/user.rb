class User < ApplicationRecord
    has_many :characters
    has_many :campaigns, through: :characters
end
