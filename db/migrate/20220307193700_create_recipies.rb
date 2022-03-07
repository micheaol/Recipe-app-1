class CreateRecipies < ActiveRecord::Migration[7.0]
  def change
    create_table :recipies do |t|

      t.timestamps
    end
  end
end
