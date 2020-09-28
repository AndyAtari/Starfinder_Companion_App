class RemoveGameMasterFromCampaigns < ActiveRecord::Migration[6.0]
  def change
    remove_column :campaigns, :game_master, :string
  end
end
