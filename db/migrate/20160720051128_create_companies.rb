class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :description
      t.float :rating

      t.timestamps null: false
    end
  end
end
