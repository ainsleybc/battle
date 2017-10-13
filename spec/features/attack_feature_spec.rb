feature 'player 1 attacks player 2' do

  before { srand(1) }

  scenario 'attack & get confirmation' do
    sign_in_and_play
    click_button "attack"
    expect(page).to have_content "Ainsley attacked Lucy!"
  end
  scenario "attack reduces player 2's HP by 5" do
    sign_in_and_play
    click_button "attack"
    expect(page).to have_content("HP: 95")
  end
end

feature 'player 2 attacks player 1' do
  
  before { srand(1) }

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
    expect(page).to have_content("HP: 89")
  end
end
