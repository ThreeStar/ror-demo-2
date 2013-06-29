require 'spec_helper'

describe "Static pages" do
  
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  
  subject { page }
  
  shared_examples_for "all static pages" do
    
    it { should have_selector('h1', :text => heading) }
    it { should have_selector('title', :text => full_title(page_title)) }
    
  end

  describe "Home page" do
    
    before { visit root_path }
    
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }
    
    it_should_behave_like "all static pages"
    it { should have_selector 'title', :text => '| Home' }
    
    # it { should have_selector('h1', :text => 'Sample App') }

    # it "should have the h1 'Sample App'" do
    #   # visit root_path
    #   page.should have_selector('h1', :text => 'Sample App')
    # end
    
    # it { should have_selector('title', :text => '| Home') }
    # it "should have the custom page title" do
    #   # visit root_path
    #   page.should have_selector('title',
    #                     :text => '| Home')# "#{base_title} | Home"
    # end
    
    # it { should have_selector('title', :text => full_title('')) }
    # it "should have the base title" do
    #   # visit root_path
    #   page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App")
    # end
    
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem")
        FactoryGirl.create(:micropost, user: user, content: "Ipsum")
        sign_in user
        visit root_path
      end
      
      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
      
      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
      
    end
  end
  
  describe "Help page" do
    
    before { visit help_path }
    
    let(:heading) { 'Help' }
    let(:page_title) { '' }
    
    it_should_behave_like "all static pages"
    
    # it { should have_selector('h1', :text => 'Help') }
    # it "should have the h1 'Help'" do
    #   page.should have_selector('h1', :text => 'Help')
    # end
    
    # it { should have_selector('title', :text => full_title('Help'))}
    # it "should have the right title" do
    #   page.should have_selector('title', :text => "#{base_title} | Help")
    # end
  end
  
  describe "About page" do
    
    before { visit about_path }
    
    let(:heading) { 'About Us' }
    let(:page_title) { '' }
    
    it_should_behave_like "all static pages"
    
    # it { should have_selector('h1', :text => 'About Us') }
    # it "should have the h1 'About Us" do
    #   visit about_path
    #   page.should have_selector('h1', :text => 'About Us')
    # end
    
    # it { should have_selector('title', :text => full_title("About Us")) }
    # it "should have the right title" do
    #   visit about_path
    #   page.should have_selector('title', :text => "#{base_title} | About Us")
    # end
  end
  
  describe "Contact page" do
    
    before { visit contact_path }
    
    let(:heading) { 'Contact' }
    let(:page_title) { '' }
    
    it_should_behave_like "all static pages"
    
    # it { should have_selector('h1', :text => 'Contact') }
    # it "should have the h1 'Contact" do
    #   visit contact_path
    #   page.should have_selector('h1', :text => 'Contact')
    # end
    
    # it { should have_selector('title', :text => full_title('Contact')) }
    # it "should have the right title" do
    #   visit contact_path
    #   page.should have_selector('title', :text => "#{base_title} | Contact")
    # end
  end
  
  it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      page.should have_selector 'title', text: full_title('About Us')
      click_link "Help"
      page.should have_selector 'title', text: full_title('Help')
      click_link "Contact"
      page.should have_selector 'title', text: full_title('Contact')
      click_link "Home"
      page.should have_selector 'title', text: full_title('Home')
      click_link "Sign up now!"
      page.should have_selector 'title', text: full_title('Sign Up')
      click_link "sample app"
      page.should have_selector 'title', text: full_title('Home')
    end
end