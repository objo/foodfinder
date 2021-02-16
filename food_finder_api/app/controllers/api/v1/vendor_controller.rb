class Api::V1::VendorController < ActionController::API
  def food
    vendors = Vendor.all 
    
    if(params[:status] == "coming_soon")
      vendors = vendors.coming_soon
    end

    render json: { results: vendors }.to_json, status: :ok
  end

  def truck
    vendors = Vendor.trucks

    if(params[:status] == "coming_soon")
      vendors = vendors.coming_soon
    else 
      vendors = vendors.active
    end

    render json: { results: vendors }.to_json, status: :ok
  end
end
