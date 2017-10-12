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

feature 'attacking player 2' do

  # player_2 = Player.new('Lucy')

  scenario 'attack & get confirmation' do
    sign_in_and_play
    click_button "attack_p2"
    expect(page).to have_content "Ainsley attacked Lucy!"
  end
  scenario "attack reduces player 2's HP by 10" do
    sign_in_and_play
    click_button "attack_p2"
    expect(page).to have_content("HP: 90")
    # expect { player_2.take_hit }.to change { player_2.hit_points }.by -10
  end
end