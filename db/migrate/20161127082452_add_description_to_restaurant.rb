class AddDescriptionToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :description, :string 
  end
end
