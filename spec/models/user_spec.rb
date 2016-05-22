require 'rails_helper'

RSpec.describe User, type: :model do
	
	it "it creates usual user" do
		@user = User.create
		expect(@user).to be
	end

end