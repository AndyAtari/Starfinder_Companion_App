class AddRaceToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :race, :string
  end
end
