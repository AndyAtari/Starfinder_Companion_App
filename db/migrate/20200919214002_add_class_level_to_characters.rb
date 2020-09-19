class AddClassLevelToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :class_level, :integer
  end
end
