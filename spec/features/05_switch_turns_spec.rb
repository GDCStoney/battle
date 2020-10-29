feature 'Switch turns' do
  context '-at the start of the game' do
    scenario 'see the current turn' do
      sign_in_and_play
      expect(page).to have_content "Dave's turn"
    end
  end

  scenario '- after player 1 attacks - next player turn' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content "Dave's turn"
    expect(page).to have_content "Jane's turn"
  end
end
