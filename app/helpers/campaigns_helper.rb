module CampaignsHelper

    def campaign_order
        @campaigns.group(:title)
    end
end
