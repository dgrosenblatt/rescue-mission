require 'rails_helper'

feature 'Edit a question' do
  # As a user
  # I want to edit a question
  # So that I can correct any mistakes or add updates
  #
  # Acceptance Criteria
  #
  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page
  scenario 'with valid information' do
    @question = Question.create(title: "T" * 50, description: "D" * 150)
    visit "/questions/#{@question.id}/edit"
    fill_in 'Title', with: ('S' * 50)
    fill_in 'Description', with: ('E' * 150)
    click_button 'Update'

    expect(page).to have_content('SSSSSSSSSS')
    expect(page).to have_content('EEEEEEEEEE')
    expect(page).to have_content('Question updated!')
  end
end
