class AddThirdpartyToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :thirdparty, :string
  end
end
