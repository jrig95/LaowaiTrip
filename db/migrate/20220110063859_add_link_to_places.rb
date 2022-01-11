class AddLinkToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :link, :string
  end
end
