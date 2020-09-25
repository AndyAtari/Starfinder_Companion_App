class ChangeJoinStatusName < ActiveRecord::Migration[6.0]
  def change
    rename_column :campaigns, :join_status, :status 
  end
end
