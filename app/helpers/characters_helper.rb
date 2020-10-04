module CharactersHelper

    def character_order
        @characters.order(:name)
    end
end
