class AddImageUrlToJedis < ActiveRecord::Migration[5.2]
  def change
    add_column :jedis, :image_url, :string
  end
end
