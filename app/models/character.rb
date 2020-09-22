class Character < ApplicationRecord
    belongs_to :campaign 
    validates :name, :race, :theme, :character_class, :class_level, presence: true
end
