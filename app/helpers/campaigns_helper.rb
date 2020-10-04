module CampaignsHelper

    def campaign_order
        @campaigns.group(:title)
    end

    def owned?(campaign)
        campaign.user_id == current_user.id
    end

    def starship_count(campaign)
        campaign.starships.count
    end

    def starships?(campaign)
        !campaign.starships.empty?
    end
end
