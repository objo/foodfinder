require 'rails_helper'

RSpec.describe Vendor, type: :model do
  
  describe "scopes" do
    describe "active" do 
      let!(:coming_soon) { create(:vendor, permit_status: Vendor::COMING_SOON)}
      let!(:approved) { create(:vendor, permit_status: Vendor::ACTIVE)}

      it "scopes coming_soon to only vendors with requested permits" do
        vendors = Vendor.active

        expect(vendors.size).to eq(1)
        expect(vendors).to match_array([approved])
        expect(vendors).not_to match_array([coming_soon])
      end
    end
    describe "coming_soon" do
      let!(:coming_soon) { create(:vendor, permit_status: Vendor::COMING_SOON)}
      let!(:approved) { create(:vendor, permit_status: Vendor::ACTIVE)}

      it "scopes coming_soon to only vendors with requested permits" do
        vendors = Vendor.coming_soon

        expect(vendors.size).to eq(1)
        expect(vendors).to match_array([coming_soon])
        expect(vendors).not_to match_array([approved])
      end
    end
    describe "trucks" do
      let!(:truck) { create(:vendor, facility_type: Vendor::TRUCK)}
      let!(:push_cart) { create(:vendor, facility_type: Vendor::CART)}

      it "scopes trucks to only return facility types of trucks" do
        vendors = Vendor.trucks

        expect(vendors.size).to eq(1)
        expect(vendors).to match_array([truck])
        expect(vendors).not_to match_array([push_cart])
      end
    end
    describe "carts" do
      let!(:truck) { create(:vendor, facility_type: Vendor::TRUCK)}
      let!(:push_cart) { create(:vendor, facility_type: Vendor::CART)}

      it "scopes trucks to only return facility types of carts" do
        vendors = Vendor.carts

        expect(vendors.size).to eq(1)
        expect(vendors).to match_array([push_cart])
        expect(vendors).not_to match_array([truck])
      end
    end
  end
end
