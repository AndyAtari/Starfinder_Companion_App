class AddDescriptionToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :description, :string
  end
end
