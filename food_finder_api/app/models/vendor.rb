class Vendor < ApplicationRecord

  PENDING = "REQUESTED"

  scope :coming_soon, -> { where("permit_status = ?", PENDING)}

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
