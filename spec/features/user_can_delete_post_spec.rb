RSpec.feature 'Delete post', type: :feature do
  scenario 'User can delete a post' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Hello, world!'
    click_link 'Delete'
    expect(page).not_to have_content('Hello, world!')
  end

  scenario 'User cannot delete other user posts' do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, universe!'
    click_button 'Submit'
    click_link 'Sign Out'
    second_user_sign_up
    visit '/users/davethecat@katze.com'

    expect(page).not_to have_link("Hello, universe!")
    expect(page).to have_content "Hello, universe!"
  end

  scenario "User can delete their own posts on someone else's wall" do
    sign_up
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Sign Out'
    second_user_sign_up
    visit '/users/davethecat@katze.com'
    click_link 'New post'
    fill_in 'Message', with: 'Hi Dave!'
    click_button 'Submit'
    click_link 'Hi Dave!'
    click_link 'Delete'
    expect(page).not_to have_content('Hi Dave!')
  end
end