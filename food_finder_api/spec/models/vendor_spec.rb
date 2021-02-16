require 'rails_helper'

RSpec.describe Vendor, type: :model do
  
  describe "scopes" do
    describe "coming_soon" do
      let!(:coming_soon) { create(:vendor, permit_status: "REQUESTED")}
      let!(:approved) { create(:vendor, permit_status: "APPROVED")}

      it "scopes coming_soon to only vendors with requested permits" do
        vendors = Vendor.coming_soon

        expect(vendors.size).to eq(1)
        expect(vendors).to match_array([coming_soon])
        expect(vendors).not_to match_array([approved])
      end
    end
    describe "trucks" do
      let!(:truck) { create(:vendor, facility_type: "Truck")}
      let!(:push_cart) { create(:vendor, facility_type: "Push Cart")}

      it "scopes trucks to only return facility types of trucks" do
        vendors = Vendor.trucks

        expect(vendors.size).to eq(1)
        expect(vendors).to match_array([truck])
        expect(vendors).not_to match_array([push_cart])
      end
    end
  end
end
