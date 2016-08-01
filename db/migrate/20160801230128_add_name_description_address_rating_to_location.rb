class AddNameDescriptionAddressRatingToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :name, :string
    add_column :locations, :description, :string
    add_column :locations, :address, :string
    add_column :locations, :rating, :integer
  end
end
