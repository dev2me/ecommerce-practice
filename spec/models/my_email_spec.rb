# == Schema Information
#
# Table name: my_emails
#
#  id         :integer          not null, primary key
#  email      :string
#  ip         :string
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe MyEmail, type: :model do
	it { should validate_presence_of(:email).with_message("Woop! Parece que olvidaste colocar el correo") }
	it { should validate_uniqueness_of(:email).with_message("Este correo ya fue registrado") }

	it "should not create with invalid email" do
		email = MyEmail.new(email:"jesus")
		expect(email.valid?).to be_falsy
	end

	it "should not create with invalid email" do
		email = MyEmail.new(email:"jesus@gruvel.com")
		expect(email.valid?).to be_truthy
	end
end
