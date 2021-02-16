require 'rails_helper'

RSpec.describe Vendor, type: :model do
  
  it "carts_scope" do
    COUNT = 2
    COUNT.times { create(:vendor) }
    expect(Vendor.count).to eq(COUNT)
  end
end
