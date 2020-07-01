require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
    before :each do
        create :user
        login_in_user(User.last) 
        visit new_user_url 
    # !!!!! looks like it went through
  scenario 'has a new user page' do
    
  feature 'signing up a user' do
    visit new_user_url
    fill_in("user[username]", with: "spongebob")
    fill_in("user[password]", "starwars")
    click_button("Submit")

  end
end
    scenario 'shows username on the homepage after signup'

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end