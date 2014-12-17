require 'rails_helper'

feature 'Delete a question' do
  # As a user
  # I want to delete a question
  # So that I can delete duplicate questions
  #
  # Acceptance Criteria
  #
  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted
  scenario 'visiting the question details page' do
    @question = Question.create(title: "T" * 50, description: "D" * 150)
    visit "/questions/#{@question.id}"

    expect(page).to have_content "Delete this question"
  end

  scenario 'visiting the question edit page' do
    @question = Question.create(title: "T" * 50, description: "D" * 150)
    visit "/questions/#{@question.id}/edit"

    expect(page).to have_content "Delete this question"
  end

  scenario 'clicking the delete link' do
    @question = Question.create(title: "T" * 50, description: "D" * 150)
    @answer = Answer.create(description: "A" * 50, question_id: @question.id)
    visit "/questions/#{@question.id}"
    click_on "Delete this question"

    expect(page).to have_content "Question and all associated answers deleted!"
    expect(page).to have_content "Recently posted questions"
    expect(page).not_to have_content @question.title
    expect(page).not_to have_content @answer.description
  end
end
