class Campaign < ApplicationRecord
    has_many :characters


    def need_players?
        if self.looking_for_players == true
            "YES!"
        else  
            "No"
        end
    end
end
