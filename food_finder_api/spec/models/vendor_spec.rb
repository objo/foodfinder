require 'rails_helper'

RSpec.describe Vendor, type: :model do
  
  it "smoke test" do
    COUNT = 2
    COUNT.times { create(:vendor) }
    expect(Vendor.count).to eq(COUNT)
  end
end
