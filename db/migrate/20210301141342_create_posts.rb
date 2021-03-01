class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.datetime :timestamp
      t.integer :jedi_id

      t.timestamps null: false
    end
  end
end
