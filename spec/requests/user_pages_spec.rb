require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }

  	before { visit user_path(user) }

  	it { should have_selector('h1', text: user.name) }
  	it { should have_selector('title', text: user.name) }
  end

  describe "signup page" do
  	before { visit signup_path }

  	it { should have_selector('h1', text: 'Sign Up') }
  	it { should have_selector('title', text: full_title('Sign Up')) }
  end

  describe "signup" do
  	before { visit signup_path }

  	let(:submit) { "Create Account" }

	describe "with invalid information" do
		it "should not create a user account" do
			expect { click_button submit }.not_to change(User, :count)
		end

		describe "after submission" do
			before { click_button submit }

			it { should have_selector('title', text: 'Sign Up') }
			it { should have_content('error') }
		end
	end

	describe "with valid information" do
		before do
			fill_in "Name",						with: "Example user"
			fill_in "Email",					with: "user@example.com"
			fill_in "Password",					with: "foobar"
			fill_in "Confirm Password",			with: "foobar"
		end

		it "should create a user" do
			expect { click_button submit }.to change(User, :count).by(1)
		end

		describe "after saving user data" do
			before { click_button submit }

			let(:user) { User.find_by_email('user@example.com') }

			it { should have_selector('title', text: user.name) }
			it { should have_selector('div.alert.alert-success', text: 'Welcome' ) }
			it { should have_link('Sign Out') }
		end
	end
  end

  describe "edit" do
  	let(:user) { FactoryGirl.create(:user) }
  	before do
  		sign_in user
  		visit edit_user_path(user)
  	end

  	describe "page" do
  		it { should have_selector('h1',		text: "Update Your Information") }
  		it { should have_selector('title',	text: "Edit Information") }
  	end

  	describe "with invalid infromation" do
  		before { click_button "Save Changes" }

  		it { should have_content('error') }
  	end

  	describe "with valid information" do
  		let(:new_name) { "New name" }
  		let(:new_email) { "new@example.com" }
  		before do
  			fill_in "Name",				with: new_name
  			fill_in "Email",			with: new_email
  			fill_in "Password", 		with: user.password
  			fill_in "Confirm Password", with: user.password 
  			click_button "Save Changes"
  		end

  		it { should have_selector('title', text: new_name) }
  		it { should have_selector('div.alert.alert-success') }
  		it { should have_link('Sign Out', href: signout_path) }
  		specify { user.reload.name.should == new_name }
  		specify { user.reload.email.should == new_email }
  	end
  end
end
