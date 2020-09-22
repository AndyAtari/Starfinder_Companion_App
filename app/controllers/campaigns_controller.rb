class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :edit, :update, :destroy] 
    
    def index
        @campaign = Campaign.all
    end

    def show

    end

    def new
        @campaign = Campaign.new
    end

    def edit

    end

    def create 
        @campaign = Campaign.new(campaign_params)
        if @campaign.save 
            redirect_to campaigns_path
        else  
            render "new"
        end
    end

    def update
        @campaign.update(campaign_params)
        redirect_to campaign_path(@campaign)
    end

    def destroy
        @campaign.destroy
        redirect_to campaigns_url 
    end

    private

    def set_campaign
        @campaign = Campaign.find(params[:id])
    end

    def campaign_params
        params.require(:campaign).permit(:title, :adventure_path, :game_master, :looking_for_players)
    end
end
