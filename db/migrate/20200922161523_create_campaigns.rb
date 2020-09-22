class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :adventure_path
      t.string :game_master
      t.boolean :looking_for_players

      t.timestamps
    end
  end
end
