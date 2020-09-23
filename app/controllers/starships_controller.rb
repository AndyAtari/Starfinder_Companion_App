class StarshipsController < ApplicationController
    before_action :set_starship, only: [:show, :edit, :update, :destroy] 
    
    def index
        @starships = Starship.all
    end

    def show

    end

    def new
        @starship = Starship.new
    end

    def edit

    end

    def create 
        @starship = Starship.new(character_params)
        if @starship.save 
            redirect_to starship_path(@starship)
        else  
            render "new"
        end
    end

    def update
        @starship.update(starship_params)
        redirect_to starship_path(@starship)
    end

    def destroy
        @starship.destroy
        redirect_to starships_url 
    end

    private

    def set_starship
        @starship = Starship.find(params[:id])
    end

    def starship_params
        params.require(:starship).permit(:name, :tier)
    end

end
