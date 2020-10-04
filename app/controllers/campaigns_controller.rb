class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:edit, :update, :destroy] 
    
    
    def index
        if params[:search]
            @campaigns = Campaign.search(params[:search])
        else  
            @campaigns = current_user.campaigns 
        end
    end

    def show
        @campaign = Campaign.find_by(id: params[:id])
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
        @campaign = Campaign.find_by(id: params[:id])
        redirect_to root_path unless @campaign && current_user.id == @campaign.user_id
    end

    def campaign_params
        params.require(:campaign).permit(:title, 
            :adventure_path,  
            :looking_for_players, 
            :status,
            :user_id,
            :search,
            character_ids: []
        )
    end
end
