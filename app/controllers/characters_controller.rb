class CharactersController < ApplicationController
    before_action :set_character, only: [:show, :edit, :update, :destroy] 
    
    def index
        @characters = Character.all
    end

    def show

    end

    def new
        @character = Character.new
    end

    def edit

    end

    def create 
        @character = Character.new(character_params)
        if @character.save 
            redirect_to character_path(@character)
        else  
            render "new"
        end
    end

    def update
        @character.update(character_params)
        redirect_to character_path(@character)
    end

    def destroy
        @character.destroy
        redirect_to characters_url 
    end

    private

    def set_character
        @character = Character.find(params[:id])
    end

    def character_params
        params.require(:character).permit(:name, :race, :theme, :character_class, :class_level, :description)
    end


end
