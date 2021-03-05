class CreatePrestiges < ActiveRecord::Migration[5.2]
  def change
    create_table :prestiges do |t|
      t.string :name
      t.string :leader
      t.string :description
      t.string :image_url

      t.timestamps null: false
    end
  end
end
