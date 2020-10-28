feature "View hit points" do
  scenario "see Player 2 hit points" do
    visit '/'
    sign_in_and_play
    expect(page).to have_content "Jane: 60HP"
  end
end
