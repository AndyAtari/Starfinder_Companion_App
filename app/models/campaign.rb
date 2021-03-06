class Campaign < ApplicationRecord
    has_many :characters
    has_many :starships
    has_many :users, through: :characters 
    belongs_to :user
    validates :title, :adventure_path, presence: true 

    def need_players?
        if self.looking_for_players == true
            "YES!"
        else  
            "No"
        end
    end

    def self.search(query)
        where("title like ?", "%#{query}%")
    end

end
