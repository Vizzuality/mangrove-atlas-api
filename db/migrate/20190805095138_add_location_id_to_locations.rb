class AddLocationIdToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :location_id, :string
  end
end
