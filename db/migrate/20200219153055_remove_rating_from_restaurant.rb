class RemoveRatingFromRestaurant < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :rating
  end
end
