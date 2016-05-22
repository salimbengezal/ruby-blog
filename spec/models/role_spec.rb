require 'rails_helper'

RSpec.describe Role, type: :model do
	
	it "it creates usual role" do
		@role = Role.create
		expect(@role).to be
	end

	it "it makes both roles and checks new usual user" do
		@user_role = Role.create(name: "user")
		@admin_role = Role.create(name: "admin")
		@user = User.create
		expect(@user.admin?).to be false
	end

	it "it makes both roles and checks new usual user" do
		@user_role = Role.create(name: "user")
		@admin_role = Role.create(name: "admin")
		@user = User.create
		@user.set_admin
		expect(@user.admin?).to be true
	end
	
end