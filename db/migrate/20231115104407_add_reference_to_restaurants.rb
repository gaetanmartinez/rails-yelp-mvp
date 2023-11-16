class AddReferenceToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :restaurant_id, :integer
  end
end
