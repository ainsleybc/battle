feature 'player 1 attacks player 2' do
  scenario 'attack & get confirmation' do
    sign_in_and_play
    click_button "attack"
    expect(page).to have_content "Ainsley attacked Lucy!"
  end
  scenario "attack reduces player 2's HP by 10" do
    sign_in_and_play
    click_button "attack"
    expect(page).to have_content("HP: 90")
  end
end

feature 'player 2 attacks player 1' do
  scenario 'attack & get confirmation' do
    sign_in_and_play
    click_button "attack"
    click_button "ok"
    click_button "attack"
    expect(page).to have_content "Lucy attacked Ainsley!"
  end

  scenario "attack reduces player 1's HP by 10" do
    sign_in_and_play
    click_button "attack"
    click_button "ok"
    click_button "attack"
    expect(page).to have_content("HP: 90")
  end
end
