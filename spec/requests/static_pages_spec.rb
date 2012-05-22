require 'spec_helper'

describe "Static Pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About')
    click_link "Contact Us"
    page.should have_selector 'title', text: full_title('Contact Us')
    click_link "Services"
    page.should have_selector 'title', text: full_title('Services')
    click_link "Home"
    click_link "Register Now!"
    page.should have_selector 'title', text: full_title('Sign Up')
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'eXact Roof Estimates' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: 'Home' }
  end

  describe "About page" do
  	before { visit about_path }
    let(:heading) { 'About' }
    let(:page_title) { 'About' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
  	before { visit contact_path }
    let(:heading) { 'Contact Us' }
    let(:page_title) { 'Contact Us' }

    it_should_behave_like "all static pages"
  end

  describe "Services page" do
  	before { visit services_path }
    let(:heading) { 'Services' }
    let(:page_title) { 'Services' }

    it_should_behave_like "all static pages"
  end
end