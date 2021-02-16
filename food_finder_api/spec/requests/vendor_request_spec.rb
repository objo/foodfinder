require 'rails_helper'

RSpec.describe "Vendors", type: :request do
  describe "/api/v1/food" do 
    let(:count) { 5 }

    before(:each) do
      count.times { create(:vendor) }
      
      get "/api/v1/food"      
    end

    it "renders json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "returns success" do
      expect(response).to have_http_status(:success)
    end

    it "returns all correct data" do
      body = JSON.parse(response.body)

      expect(body).to have_key("results")

      vendors = body["results"]

      expect(vendors.size).to eq(count)
    end
  end
end
