require 'spec_helper'

describe "Static pages" do
  
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  
  subject { page }

  describe "Home page" do
    
    before { visit root_path }
    
    it { should have_selector('h1', :text => 'Sample App') }

    # it "should have the h1 'Sample App'" do
    #   # visit root_path
    #   page.should have_selector('h1', :text => 'Sample App')
    # end
    
    it { should have_selector('title', :text => '| Home') }
    # it "should have the custom page title" do
    #   # visit root_path
    #   page.should have_selector('title',
    #                     :text => '| Home')# "#{base_title} | Home"
    # end
    
    it { should have_selector('title', :text => full_title('')) }
    # it "should have the base title" do
    #   # visit root_path
    #   page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App")
    # end
  end
  
  describe "Help page" do
    
    before { visit help_path }
    
    it { should have_selector('h1', :text => 'Help') }
    # it "should have the h1 'Help'" do
    #   page.should have_selector('h1', :text => 'Help')
    # end
    
    it { should have_selector('title', :text => full_title('Help'))}
    # it "should have the right title" do
    #   page.should have_selector('title', :text => "#{base_title} | Help")
    # end
  end
  
  describe "About page" do
    
    before { visit about_path }
    
    it { should have_selector('h1', :text => 'About Us') }
    # it "should have the h1 'About Us" do
    #   visit about_path
    #   page.should have_selector('h1', :text => 'About Us')
    # end
    
    it { should have_selector('title', :text => full_title("About Us")) }
    # it "should have the right title" do
    #   visit about_path
    #   page.should have_selector('title', :text => "#{base_title} | About Us")
    # end
  end
  
  describe "Contact page" do
    
    before { visit contact_path }
    
    it { should have_selector('h1', :text => 'Contact') }
    # it "should have the h1 'Contact" do
    #   visit contact_path
    #   page.should have_selector('h1', :text => 'Contact')
    # end
    
    it { should have_selector('title', :text => full_title('Contact')) }
    # it "should have the right title" do
    #   visit contact_path
    #   page.should have_selector('title', :text => "#{base_title} | Contact")
    # end
  end
end