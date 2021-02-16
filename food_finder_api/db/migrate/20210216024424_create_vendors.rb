class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.integer :location_id

      t.string :name
      t.string :facility_type
      t.string :location_description
      t.string :address 
      t.string :permit_status
      t.string :food_description
      t.float :latitude
      t.float :longitude
      t.string :days_hours
      
      t.timestamps
    end
  end
end
