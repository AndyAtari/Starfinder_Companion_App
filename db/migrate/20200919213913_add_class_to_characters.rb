class AddClassToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :class, :string
  end
end
