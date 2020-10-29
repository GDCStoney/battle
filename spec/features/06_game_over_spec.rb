feature 'Game over' do
  context '- player 1 has 0HP' do
    before do
      sign_in_and_play
      attack_and_confirm
      allow(Kernel).to receive(:rand).and_return(60)
    end

    scenario 'Player 1 loses' do
      click_button 'Attack'
      expect(page).to have_content 'Dave loses!'
    end
  end

  context '- player 2 has 0HP' do
    before do
      sign_in_and_play
      allow(Kernel).to receive(:rand).and_return(60)
    end

    scenario 'Player 2 loses' do
      click_button 'Attack'
      expect(page).to have_content 'Jane loses!'
    end
  end
end
