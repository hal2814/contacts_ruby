
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_excepeptions, false)

describe('list path', {:type => :feature}) do
  it "will display user input into list" do
    visit('/')
    fill_in('name', :with => 'Nate')
    fill_in('last', :with => 'McGregor')
    fill_in('phone', :with => '503-747-3455')
    fill_in('street', :with => '2424 Main St')
    fill_in('city', :with => 'Portland')
    fill_in('state', :with => 'OR')
    fill_in('zip', :with => '97485')

    click_button('Go!')
    expect(page).to have_content('McGregor, Nate')
  end
  it "display name of clicked item" do
    visit('/')
    click_link('McGregor, Nate')
    expect(page).to have_content('Name: Nate McGregor')
    expect(page).to have_content('phone: 503-747-3455')
    expect(page).to have_content('address: 2424 Main St ,Portland, OR, 97485')
  end
  it "delete item" do
    visit('/contact/1')
    click_button('Delete!')
    visit('/')
    expect(page).to have_no_content('Name: McGregor, Nate')
  end
  it "will modify object" do
    visit('/')
    fill_in('name', :with => 'Nate')
    fill_in('last', :with => 'McGregor')
    fill_in('phone', :with => '503-747-3455')
    fill_in('street', :with => '2424 Main St')
    fill_in('city', :with => 'Portland')
    fill_in('state', :with => 'OR')
    fill_in('zip', :with => '97485')
    click_button('Go!')
    visit('/contact/1')
    click_link('Update your contact')
    visit('/update/1')
    fill_in('name', :with => 'Bob')
    fill_in('last', :with => 'Joe')
    fill_in('phone', :with => '503-747-3455')
    fill_in('street', :with => '2424 Main St')
    fill_in('city', :with => 'Portland')
    fill_in('state', :with => 'OR')
    fill_in('zip', :with => '97485')
    click_button('Update')
    visit('/')
    expect(page).to have_content('Joe, Bob')
  end
end
