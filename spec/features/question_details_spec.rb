require 'rails_helper'

feature 'View details of a question' do
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question
  #
  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description
  scenario 'visit show page for a question' do
    visit '/questions/new'
    Question.create!(title: "What's the deal with Ruby on Rails? Help ASAP",
                    description: "I'm trying to build a new app. I typed in rails
                    generate scaffold, but I don't have the next facebook yet.
                    Someone please help. I don't have much time left and I'd
                    like to have at least a few billion dollars by the end of
                    business tomorrow. Kthxbye.")
    visit '/questions'
    click_link "What's the deal with Ruby on Rails? Help ASAP"

    expect(page).to have_content "What's the deal with Ruby on Rails? Help ASAP"
    expect(page).to have_content "a few billion dollars"
  end
end
