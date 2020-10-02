class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :edit, :update, :destroy] 
    
    
    def index
        if params[:search]
            @campaigns = Campaign.search(params[:search])
        else  
            @campaigns = current_user.campaigns 
        end
    end

    def show
        @starship = @campaign.starships.build
    end

    def new
        @campaign = Campaign.new
    end

    def edit
        redirect_to root_path unless current_user.id == @campaign.user_id 
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
        if current_user.id == @campaign.user_id
            @campaign.update(campaign_params)
            redirect_to campaigns_path
        else  
            redirect_to root_path
        end
    end

    def destroy
        if current_user.id == @campaign.user_id
            @campaign.destroy
            redirect_to campaigns_url 
        else  
            redirect_to root_path
        end
    end

    private

    def set_campaign
        @campaign = Campaign.find_by(id: params[:id])
        redirect_to root_path unless @campaign 
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
