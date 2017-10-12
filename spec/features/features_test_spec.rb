feature "starting a fight" do
  scenario "enter names on the home page, then see them on screen" do
    sign_in_and_play
    expect(page).to have_content("Ainsley","Lucy")
  end
end

feature "shows hit point" do
  scenario "redirected to /play" do
    sign_in_and_play
    expect(page).to have_content("HP: 100", "HP: 100")
  end
end

feature 'shows who the winner is' do
  scenario 'shows the winner once a players HP reaches 0' do
    sign_in_and_play
    19.times do 
      click_button 'attack'
      click_button 'ok'
    end
    expect(page).to have_content 'Ainsley wins!'
  end
end
