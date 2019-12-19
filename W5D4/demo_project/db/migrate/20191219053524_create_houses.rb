class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|           # crates a table
      t.string :address                   # structure columns

      t.timestamps
    end
  end
end
