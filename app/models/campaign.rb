class Campaign < ApplicationRecord
    has_many :characters
    has_many :starships
    has_many :users, through: :characters 
    validates :title, presence: true 

    def need_players?
        if self.looking_for_players == true
            "YES!"
        else  
            "No"
        end
    end

    def join_game?
        self.looking_for_players == true
    end

    def not_joined_game?
        self.status == false
    end

    def joined_game?
       if self.status == true
        "Pending"
       end
    end

    
end
