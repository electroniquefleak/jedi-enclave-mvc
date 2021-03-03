class CreatePrestiges < ActiveRecord::Migration[5.2]
  def change
    create_table :prestiges do |t|
      t.string :name
      t.string :founder
      t.string :leader

      t.timestamps null: false
    end
  end
end
