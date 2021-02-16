class Api::V1::VendorController < ActionController::API
  def food
    vendors = Vendor.all 
    
    render json: { results: vendors }.to_json, status: :ok
  end
end
