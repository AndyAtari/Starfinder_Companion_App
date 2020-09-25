class AddJoinStatusToCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :join_status, :boolean, :default => false
  end
end
