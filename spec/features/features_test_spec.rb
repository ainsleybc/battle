require "capybara/rspec"
require 'player'
require_relative '../../app.rb'

Capybara.app = Battle

feature "starting a fight" do
  scenario "enter names on the home page, then see them on screen" do
    sign_in_and_play
    expect(page).to have_content("Ainsley","Lucy")
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
