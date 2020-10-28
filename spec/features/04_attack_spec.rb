feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_button 'Attack P2'
    expect(page).to have_content "Dave attacked Jane"
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button 'Attack P2'
    click_link 'OK'
    expect(page).not_to have_content 'Jane: 60HP'
    expect(page).to have_content 'Jane: 50HP'
  end 
end
