def sign_in_and_play
  visit("/")
  fill_in :player_1_name, with: "Ainsley"
  fill_in :player_2_name, with: "Lucy"
  click_button "Fight!"
end 
