require 'spec_helper'

describe "Static Pages" do

  let(:base_title) {"eXact Roof Estimates"}

  describe "Home page" do
    it "should have the h1 'eXact Roof Estimates'" do
      visit root_path
      page.should have_selector('h1', :text => "eXact Roof Estimates")
    end

    it "should have the base_title" do
      visit root_path
      page.should have_selector('title', :text => "#{base_title}")
    end

    it "should have a custom page title" do
      visit root_path
      page.should have_selector('title', :text => "#{base_title} || Home")
    end
  end

  describe "About page" do
  	it "should have the h1 'About'" do
  	  visit about_path
  	  page.should have_selector('h1', :text => "About")
  	end

    it "should have the base_title" do
      visit about_path
      page.should have_selector('title', :text => "#{base_title}")
    end

  	it "should a custom page title" do
  	  visit about_path
	    page.should have_selector('title', :text => "#{base_title} || About")
	 end
  end

  describe "Contact page" do
  	it "should have the h1 'Contact Us'" do
  	  visit contact_path
  	  page.should have_selector('h1', :text => "Contact Us")
  	end

    it "should have the base_title" do
      visit contact_path
      page.should have_selector('title', :text => "#{base_title}")
    end

  	it "should have a custom page title" do
  	  visit contact_path
  	  page.should have_selector('title', :text => "#{base_title} || Contact Us")
	  end  	  
  end

  describe "Register page" do
  	it "should have the h1 'Register'" do
  	  visit register_path
  	  page.should have_selector('h1', :text => "Register")
  	end

    it "should have the base_title" do
      visit register_path
      page.should have_selector('title', :text => "#{base_title}")
    end

  	it "should have a custom page title" do
  	  visit register_path
  	  page.should have_selector('title', :text => "#{base_title} || Register")
  	end
  end
end