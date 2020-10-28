=begin
test now invalid due to '/' site added functionality

feature 'Testing Infrastructure' do
  scenario 'Can run app and check page content' do
    visit '/'
    expect(page).to have_content 'Testing infrastructure working!'
  end
end
=end
