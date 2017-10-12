require "capybara/rspec"
require_relative '../../app.rb'

Capybara.app = Battle

feature "starting a fight" do
  scenario "enter names on the home page, then see them on screen" do
    sign_in_and_play
    expect(page).to have_content("Ainsley","Canace")
  end
end

feature "shows hit point" do
  scenario "redirected to /play" do
    sign_in_and_play
    player_1_hp, = 100
    player_2_hp = 100
    expect(page).to have_content("HP: #{player_1_hp}", "HP: #{player_2_hp}")
  end
end

feature 'attacking player 2' do
  scenario 'attack & get confirmation' do
    sign_in_and_play
    click_button "attack_p2"
    expect(page).to have_content "Ainsley attacked Canace!"
  end
end
