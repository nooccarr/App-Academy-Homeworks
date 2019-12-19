class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|             # creates a table
      t.string :name, null: false           # structure columns
      t.integer :house_id, null: false

      t.timestamps
    end

    add_index :people, :house_id            # add index for bsearch
  end                                       # for foreign keys 
end
