class AddThemeToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :theme, :string
  end
end
