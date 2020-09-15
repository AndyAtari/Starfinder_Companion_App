class CharactersController < ApplicationController
    before_action :set_character, only: [:show, :edit, :update, :destroy] 
    
    def index

    end

    def show

    end

    def new

    end

    def edit

    end

    def create 

    end

    def update

    end

    def destroy

    end

    private

    def set_character
        @character = Character.find(params[:id])
    end

    def character_params
        params.require(:character).permit(:name)
    end


end
