class CreateJedis < ActiveRecord::Migration[5.2]
  def change
    create_table :jedis do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.integer :prestige_id

      t.timestamps null: false
    end
  end
end
