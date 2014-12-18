require 'rails_helper'

feature 'Answer another users question' do
  # As a user
  # I want to answer another user's question
  # So that I can help them solve their problem
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  scenario 'with valid information' do
    @question = FactoryGirl.create(:question)
    visit "/questions/#{@question.id}"
    fill_in "Answer this question:", with: ('A' * 50)
    click_on 'Save Answer'

    expect(page).to have_content "Answer submitted!"
  end

  context 'with invalid information' do
    scenario 'without a description' do
      @question = FactoryGirl.create(:question)
      visit "/questions/#{@question.id}"
      click_on 'Save Answer'

      expect(page).to have_content "Description can't be blank"
    end

    scenario 'with a short description' do
      @question = FactoryGirl.create(:question)
      visit "/questions/#{@question.id}"
      fill_in 'Answer this question:', with: 'blerg'
      click_on 'Save Answer'

      expect(page).to have_content "Description is too short"
    end
  end
end
