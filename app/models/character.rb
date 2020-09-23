class Character < ApplicationRecord
    belongs_to :campaign 
    validates :name, :race, :theme, :character_class, :class_level, presence: true
    accepts_nested_attributes_for :campaign

end
