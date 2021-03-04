class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :jedi_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
