# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string
#  pricing             :decimal(, )
#  description         :text
#  user_id             :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

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
