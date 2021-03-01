class CreateClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :classes do |t|
      t.string :name
      t.string :founder
      t.string :leader

      t.timestamps null: false
    end
  end
end
