class CreateJedi < ActiveRecord::Migration[5.2]
  def change
    create_table :jedi do |t|
      t.string :username
      t.string :name
      t.integer :house_id
      t.integer :friend_id

      t.timestamps null: false
    end
  end
end
