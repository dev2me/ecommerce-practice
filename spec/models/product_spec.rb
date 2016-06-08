require 'rails_helper'

RSpec.describe Product, type: :model do
  it{ should validate_presence_of :name }
  it{ should validate_presence_of :pricing }
  it{ should validate_presence_of :user }

  it "should validates pricing > 0" do
  	product = FactoryGirl.build(:product, pricing: 0)
  	expect(product.valid?).to be_falsy
  	puts product.inspect
  end
end
