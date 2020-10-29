feature 'Attacking' do

  context 'for the first round' do
    scenario '- attack Player 2' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content 'Dave attacked Jane'
    end

    scenario 'reduce Player 2 HP by x' do
      sign_in_and_play
      attack_and_confirm
      expect(page).not_to have_content 'Jane: 60HP'
      expect(page).to have_content 'Dave: 60HP'
    end
  end

  context 'for the second attack' do
    scenario '- attack Player 1' do
      sign_in_and_play
      attack_and_confirm
      click_button 'Attack'
      expect(page).to have_content 'Jane attacked Dave'
    end

    scenario 'reduce Player 1 HP by x' do
      sign_in_and_play
      2.times { attack_and_confirm }
      expect(page).not_to have_content 'Dave: 60HP'
    end
  end
end
