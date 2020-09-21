class Character < ApplicationRecord
    validates :name, :race, :theme, :character_class, :class_level, presence: true
end
