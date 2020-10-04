module StarshipsHelper

    def starship_order
        @starships.group(:name)
    end
end
