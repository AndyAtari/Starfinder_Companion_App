class AddCampaignIdToStarships < ActiveRecord::Migration[6.0]
  def change
    add_column :starships, :campaign_id, :integer
  end
end
