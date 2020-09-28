class RemoveStatusFromCampaigns < ActiveRecord::Migration[6.0]
  def change
    remove_column :campaigns, :status, :boolean
  end
end
