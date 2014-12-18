require 'rails_helper'

feature 'View answers for one question' do
  # As a user
  # I want to view the answers for a question
  # So that I can learn from the answer
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must only see answers to the question I'm viewing
  # - I must see all answers listed in order, most recent last
  scenario 'visting the show page for a question' do
    @question = FactoryGirl.create(:question)
    visit "/questions/#{@question.id}"
    fill_in 'Answer this question:', with: 'A' * 50
    click_on 'Save Answer'
    fill_in 'Answer this question:', with: 'B' * 50
    click_on 'Save Answer'
    fill_in 'Answer this question:', with: 'C' * 50
    click_on 'Save Answer'

    expect(page).to have_content 'AAAAAAAAAA'
    expect(page).to have_content 'BBBBBBBBBB'
    expect(page).to have_content 'CCCCCCCCCC'
  end
end
