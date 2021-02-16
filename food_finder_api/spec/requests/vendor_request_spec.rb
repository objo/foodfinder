require 'rails_helper'

RSpec.describe "Vendors", type: :request do
  describe "All vendors" do 
    describe "/api/v1/food" do 
      let(:count) { 5 }
  
      before(:each) do
        count.times { create(:vendor, permit_status: "APPROVED") }
        get "/api/v1/food"      
      end
  
      it "renders json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
  
      it "returns success" do
        expect(response).to have_http_status(:success)
      end
  
      it "returns all vendors" do
        body = JSON.parse(response.body)
  
        expect(body).to have_key("results")
  
        vendors = body["results"]
  
        expect(vendors.size).to eq(count)
      end
    end
  
    describe "/api/v1/food/coming_soon" do 
      let!(:coming_soon) { create(:vendor, permit_status: "REQUESTED")}
      let!(:approved) { create(:vendor, permit_status: "APPROVED")}
  
      before(:each) do
        get "/api/v1/food/coming_soon"      
      end
  
      it "renders json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
  
      it "returns success" do
        expect(response).to have_http_status(:success)
      end
  
      it "returns all vendors" do
        body = JSON.parse(response.body)
  
        expect(body).to have_key("results")
  
        vendors = body["results"]
  
        expect(vendors.size).to eq(1)
        expect(vendors[0]["permit_status"]).to eq(coming_soon.permit_status)
      end
    end
  end
  describe "Trucks" do 
    describe "/api/v1/trucks" do 
      let!(:truck) { create(:vendor, facility_type: "Truck", )}
      let!(:push_cart) { create(:vendor, facility_type: "Push Cart")}

      before(:each) do
        get "/api/v1/truck/"      
      end
  
      it "renders json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
  
      it "returns success" do
        expect(response).to have_http_status(:success)
      end
  
      it "returns all vendors" do
        body = JSON.parse(response.body)
  
        expect(body).to have_key("results")
  
        vendors = body["results"]
  
        expect(vendors.size).to eq(1)
        expect(vendors[0]["facility_type"]).to eq(truck.facility_type)
      end
    end

    describe "/api/v1/trucks/coming_soon" do 
      let!(:truck) { create(:vendor, facility_type: "Truck", permit_status: "APPROVED")}
      let!(:push_cart) { create(:vendor, facility_type: "Push Cart", permit_status: "APPROVED")}
      let!(:truck_coming_soon) { create(:vendor, facility_type: "Truck", permit_status: "REQUESTED")}
      let!(:push_cart_coming_soon) { create(:vendor, facility_type: "Push Cart", permit_status: "REQUESTED")}

      before(:each) do
        get "/api/v1/truck/"      
      end
  
      it "renders json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
  
      it "returns success" do
        expect(response).to have_http_status(:success)
      end
  
      it "returns all vendors" do
        body = JSON.parse(response.body)
  
        expect(body).to have_key("results")
  
        vendors = body["results"]
  
        expect(vendors.size).to eq(1)
        expect(vendors[0]["facility_type"]).to eq(truck_coming_soon.facility_type)
      end
    end
  end
 
end
