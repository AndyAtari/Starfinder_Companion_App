class Starship < ApplicationRecord
    belongs_to :campaign
    validates :name, :tier, presence: true 
end
