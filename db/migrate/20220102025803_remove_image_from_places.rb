class RemoveImageFromPlaces < ActiveRecord::Migration[6.0]
  def change
    remove_column :places, :image, :string
  end
end
