class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :city_name
      t.string :amenities
      t.integer :price_by_night
      t.integer :number_rooms
      t.boolean :available
      t.string :view
      t.string :place_name
      t.integer :max_guest
      t.text :description
      t.integer :number_bathrooms

      t.timestamps
    end
  end
end
