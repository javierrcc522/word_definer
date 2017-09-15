require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

  describe('my define word', {:type => :feature}) do
    it ('processes the user entry and returns a list of words') do
      visit('/')
      fill_in('define_word', :with => 'margaret')
      click_button('add word')
      expect(page).to have_content('margaret')
    end
  end


  # describe('a contact', {:type => :feature}) do
  #   it ('goes to the detail page') do
  #     visit('/')
  #     save_and_open_page
  #     click_link("kitten margaret")
  #     expect(page).to have_content('margaret')
  #   end
  # end
