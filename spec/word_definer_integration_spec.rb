require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("WordDefiner") do
  before() do
      WordDefiner.clear()
    end

  describe('puts my define word in the list', {:type => :feature}) do
    it ('processes the user entry and returns a list of words') do
      visit('/')
      fill_in('define_word', :with => 'mango')
      click_button('add word')
      expect(page).to have_content('mango')
    end
  end

  describe('click on the define words', {:type => :feature}) do
    it ('processes the user entry where a user can click on the link of the difine word') do
      visit('/')
      fill_in('define_word', :with => 'monitor')
      click_button('add word')
      expect(page).to have_content('monitor')
    end
  end

  describe('it removes a define word', {:type => :feature}) do
    it ('processes the user entry where a user can click button and it will delete the define word') do
      visit('/')
      fill_in('define_word', :with => 'macbook')
      click_button('add word')
      click_link('macbook')
      click_button('delete word')
      expect(page).to have_no_content('macbook')
    end
  end

  describe('it adds multiple word defines', {:type => :feature}) do
    it ('processes the user entry where a user can click on the Add word button and add more words') do
      visit('/')
      fill_in('define_word', :with => 'cats')
      click_button('add word')
      fill_in('define_word', :with => 'dogs')
      click_button('add word')
      expect(page).to have_content('cats', 'dogs')
    end
  end

end
