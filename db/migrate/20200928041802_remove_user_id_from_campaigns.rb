class RemoveUserIdFromCampaigns < ActiveRecord::Migration[6.0]
  def change
    remove_column :campaigns, :user_id, :integer
  end
end
