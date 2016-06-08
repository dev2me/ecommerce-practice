require 'rails_helper'

RSpec.describe MyEmail, type: :model do
	it { should validate_presence_of(:email).with_message("Woop! Parece que olvidaste colocar el correo") }
	it { should validate_uniqueness_of(:email).with_message("Este correo ya fue registrado") }
end
