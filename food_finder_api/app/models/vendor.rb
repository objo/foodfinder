class Vendor < ApplicationRecord

  COMING_SOON = "REQUESTED"
  ACTIVE = "APPROVED"
  TRUCK = "Truck"
  CART = "Push Cart"

  scope :active, -> { where("permit_status = ?", ACTIVE) }
  scope :coming_soon, -> { where("permit_status = ?", COMING_SOON) }
  scope :trucks, -> { where("facility_type = ?", TRUCK) }
  scope :carts, -> { where("facility_type = ?", CART) }

  def self.from_csv(row)
    create do |vendor|
      vendor.name = row["Applicant"]
      vendor.facility_type = row["FacilityType"]
      vendor.location_description = row["LocationDescripton"]
      vendor.address = row["Address"]
      vendor.permit_status = row["Status"]
      vendor.food_description = row["FoodItems"]
      vendor.latitude = row["Latitude"]
      vendor.longitude = row["Longitude"]
      vendor.days_hours = row["dayshours"]
    end
  end
end
