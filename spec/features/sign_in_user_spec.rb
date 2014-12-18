require 'rails_helper'

feature 'Sign in with facebook' do
  scenario 'from the questions index page' do
    visit '/questions'

    expect(page).to have_content "Sign in with Facebook"
  end
end

# feature 'Sign in' do
#   scenario 'signing in' do
#     user = FactoryGirl.create(:user)
#     sign_in(user)
#   end
# end
#
# # Screencast for testing devise
#
# # do something before every scenario
# context "authenticated user" do
#   before :each do
#     @user = FactoryGirl.create(:user) # needs to be instance variable to use in scenarios
#     visit new_user_session_path # devise sign in page
#     fill_in "Email", with: @user.email
#     #and password
#     within ".new_user" do #look just inside this css selector
#       click_on "Sign In"
#     end
#   end
#
#   scenario
#   scenario
#   scenario
# end
#
# context "unauthenticated user" do
#   scenario
#   scenario
# end
