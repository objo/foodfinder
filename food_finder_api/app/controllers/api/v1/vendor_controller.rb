class Api::V1::VendorController < ActionController::API
  def food
    vendors = Vendor.all 
    
    if params[:near]
      vendors = vendors.by_distance origin: params[:near]
    end
    
    if params[:status] == "coming_soon"
      vendors = vendors.coming_soon
    else
      vendors = vendors.active
    end

    render json: { results: vendors }.to_json, status: :ok
  end

  def truck
    vendors = Vendor.trucks

    if params[:near]
      vendors = vendors.by_distance origin: params[:near]
    end

    if params[:status] == "coming_soon"
      vendors = vendors.coming_soon
    else 
      vendors = vendors.active
    end

    render json: { results: vendors }.to_json, status: :ok
  end

  def carts
    vendors = Vendor.carts

    if params[:near]
      vendors = vendors.by_distance origin: params[:near]
    end

    if params[:status] == "coming_soon"
      vendors = vendors.coming_soon
    else 
      vendors = vendors.active
    end

    render json: { results: vendors }.to_json, status: :ok
  end
end
