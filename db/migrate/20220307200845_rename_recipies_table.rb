class RenameRecipiesTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :recipies, :recipes
  end
end
