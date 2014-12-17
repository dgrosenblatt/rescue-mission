require 'rails_helper'

feature 'Sign in with facebook' do
  scenario 'from the questions index page' do
    visit '/questions'

    expect(page).to have_content "Sign in with Facebook"
  end
end
