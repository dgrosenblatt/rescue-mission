require 'rails_helper'

feature 'Post a question' do
  # As a user
  # I want to post a question
  # So that I can receive help from others
  #
  # Acceptance Criteria
  #
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario 'visiting the new questions page' do
    visit '/questions/new'

    expect(page).to have_content 'Ask a new question'
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Description'
  end

  scenario 'with valid information' do
    visit '/questions/new'
    fill_in 'Title', with: ('T' * 40)
    fill_in 'Description',  with: ('D' * 150)
    click_on  'Create Question'

    expect(page).to have_content 'New question submitted!'
  end

  context 'with invalid information' do
    scenario 'missing a title' do
      visit '/questions/new'
      fill_in 'Description',  with: ('D' * 150)
      click_on  'Create Question'

      expect(page).to have_content "Title can't be blank"
    end

    scenario 'with a short title' do
      visit '/questions/new'
      fill_in 'Title', with: 'blerg'
      fill_in 'Description',  with: ('D' * 150)
      click_on  'Create Question'

      expect(page).to have_content 'Title is too short'
    end

    scenario 'missing a description' do
      visit '/questions/new'
      fill_in 'Title', with: ('T' * 40)
      click_on 'Create Question'

      expect(page).to have_content "Description can't be blank"
    end

    scenario 'with a short description' do
      visit '/questions/new'
      fill_in 'Title', with: ('T' * 40)
      fill_in 'Description', with: 'blerg'
      click_on 'Create Question'

      expect(page).to have_content 'Description is too short'
    end
  end
end
