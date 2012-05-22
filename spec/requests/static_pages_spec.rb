require 'spec_helper'

describe "Static Pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'eXact Roof Estimates') }
    it { should have_selector('title', text: full_title('')) }
  end

  describe "About page" do
  	before { visit about_path }

    it { should have_selector('h1', text: 'About') }
    it { should have_selector('title', text: full_title('About')) }
  end

  describe "Contact page" do
  	before { visit contact_path }

    it { should have_selector('h1', text: 'Contact Us') }
    it { should have_selector('title', text: full_title('Contact Us')) } 
  end

  describe "Services page" do
  	before { visit services_path }

    it { should have_selector('h1', text: 'Services') }
    it { should have_selector('title', text: full_title('Services')) }
  end
end