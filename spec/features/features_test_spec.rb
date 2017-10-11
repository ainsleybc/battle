require_relative '../../app.rb'

feature "display testing infrastructure" do
  scenario "go to homepage" do
    visit("/")

    expect(page).to have_content "Testing infrastructure working!"
  end 
end
