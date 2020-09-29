class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :edit, :update, :destroy] 
    
    
    def index
        @campaigns = current_user.campaigns 
    end

    def show
        @starship = @campaign.starships.build
    end

    def new
        @campaign = Campaign.new
    end

    def edit

    end

    def create 
        @campaign = current_user.owned_campaigns.build(campaign_params)
        if @campaign.save 
            redirect_to campaigns_path
        else  
            render "new"
        end
    end

    def update
        @campaign.update(campaign_params)
        redirect_to campaigns_path
    end

    def destroy
        @campaign.destroy
        redirect_to campaigns_url 
    end

    private

    def set_campaign
        @campaign = current_user.campaigns.find(params[:id])
    end

    def campaign_params
        params.require(:campaign).permit(:title, 
            :adventure_path,  
            :looking_for_players, 
            :status,
            :user_id,
            character_ids: []
        )
    end
end
