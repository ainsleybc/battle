feature 'switching turns' do
  scenario 'start turn on player 1' do
    sign_in_and_play
    expect(page).to have_content "Ainsley's turn"
  end
  scenario 'switches turn to player 2' do
    sign_in_and_play
    click_button "attack"
    click_button "ok"
    expect(page).to have_content "Lucy's turn"
  end
end
