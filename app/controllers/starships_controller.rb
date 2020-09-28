class StarshipsController < ApplicationController
    before_action :set_starship, only: [:show, :edit, :update, :destroy] 
    
    def index
         if params[:campaign_id]
            @starships = Campaign.find(params[:campaign_id]).starships 
         else  
            @starships = Starship.all  
         end 
    end

    def show
        
    end

    def new
        @starship = Starship.new
    end

    def edit

    end

    def create 
        @campaign = Campaign.find(params[:campaign_id])
        @starship = @campaign.starships.build(starship_params)
        if @starship.save 
            redirect_to campaign_path(@campaign)
        else  
            render "campaigns/show"
        end
    end

    def update
        @starship.update(starship_params)
        redirect_to starships_path
    end

    def destroy
        @starship.destroy
        redirect_to starships_url 
    end

    private

    def set_starship
        @starship = current_user.starships.find(params[:id])
    end

    def starship_params
        params.require(:starship).permit(:name, :tier)
    end

end
