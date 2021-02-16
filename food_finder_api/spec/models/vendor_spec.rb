require 'rails_helper'

RSpec.describe Vendor, type: :model do
  
  describe "scopes" do
    let!(:coming_soon) { create(:vendor, permit_status: "REQUESTED")}
    let!(:approved) { create(:vendor, permit_status: "APPROVED")}

    describe "coming_soon"
      it "scopes coming_soon to only vendors with requested permits" do
        vendors = Vendor.coming_soon

        expect(vendors.size).to eq(1)
        expect(vendors).to match_array([coming_soon])
        expect(vendors).not_to match_array([approved])
      end
    end
end
