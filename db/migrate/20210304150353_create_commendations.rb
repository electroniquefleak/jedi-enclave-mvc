class CreateCommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :commendations do |t|
      t.integer :jedi_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
