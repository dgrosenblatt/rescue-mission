require 'rails_helper'

feature 'Mark an answer as the best answer' do
  # As a user
  # I want to mark an answer as the best answer
  # So that others can quickly find the answer
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must be able mark an answer as the best
  # - I must see the "best" answer above all other answers in the answer list
  scenario 'clicking the best answer link' do
    @question = FactoryGirl.create(:question)
    @answer1  = FactoryGirl.create(:answer, description: 'F' * 50, question_id: @question.id)
    @answer2  = FactoryGirl.create(:answer, question_id: @question.id)
    visit "/questions/#{@question.id}"
    click_on("This is the best answer", match: :first)

    expect(page).to have_content "*BEST ANSWER*"
    expect('FFFFFFF').to appear_before('Here is an answer to your question')
  end
end
