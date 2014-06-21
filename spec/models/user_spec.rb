require 'spec_helper'

describe User do
	
	before {@user= User.create(username: 'steph', email: 'steph@gmail.com', password: '123456')}
	subject {@user}

	it "should be valid with name, email and password" do
		expect(@user).to be_valid
	end

	describe ":username" do
		before {@user= User.create(username: 'steph', email: 'steph@gmail.com', password: '123456')}
		
		it "should be invalid without a username" do
			@user.username =nil
			expect(@user).to be_invalid
		end 
		it "should have a unique username" do

			@user2= User.new(username: 'steph', email: 'steph2@gmail.com', password: '123456')
			@user2.save
			expect(@user).to be_invalid
		end
	end

	describe ":email" do
		before {@user= User.create(username: 'steph', email: 'steph@gmail.com', password: '123456')}
		
		it "should be invalid without an email" do
			@user.email =nil
			expect(@user).to be_invalid
		end

		it "should have a unique email" do
			@user3= User.new(username: 'steph3', email: 'steph@gmail.com', password: '123456')
			expect(@user).to be_invalid
		end

		it "should have an email with the proper format" do
			@user4= User.new(username: 'steph', email: 'stephsteph', password: '123456')
			@user4.save
			expect(@user4).to_not be_persisted
		end
	end

	describe ":password" do
		it "should be invalid without a password" do
			@user.password=nil
			expect(@user).to be_invalid
		end

		it "should be invalid with a password length less than 6" do
			@user4= User.new(username: 'steph', email: 'steph@gmail.com', password: '12345')
			expect(@user4).to be_invalid
		end

		it "should be invalid with a password length higher than 20" do
			@user5= User.new(username: 'steph', email: 'steph@g mail.com', password: '1234567891234567891234567345455667785654543543')
			expect(@user5).to be_invalid
		end
	end
	
end



