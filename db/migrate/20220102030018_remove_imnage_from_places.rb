class RemoveImnageFromPlaces < ActiveRecord::Migration[6.0]
  def change
    remove_column :places, :imnage, :string
  end
end
