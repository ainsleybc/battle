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
