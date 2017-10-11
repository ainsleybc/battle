require "capybara/rspec"
require_relative '../../app.rb'

Capybara.app = Battle

feature "display testing infrastructure" do
  xscenario "go to homepage" do
    visit("/")
    expect(page).to have_content "Testing infrastructure working!"
  end
end

feature "starting a fight" do
  scenario "enter names on the home page, then see them on screen" do
    visit("/")
    # require 'launchy'; save_and_open_page
    fill_in :player_1_name, with: "Ainsley"
    fill_in :player_2_name, with: "Canace"
    click_button "submit"
    expect(page).to have_content("Ainsley","Canace")
  end
end
