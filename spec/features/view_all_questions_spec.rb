require 'rails_helper'

feature 'View recently posted questions' do
  # As a user
  # I want to view recently posted questions
  # So that I can help others
  #
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first
  scenario 'visiting the questions index page' do
    q1 = FactoryGirl.create(:question, title: "What's the deal with Ruby on Rails? Help ASAP",
                        description: "I'm trying to build a new app. I typed in rails
                        generate scaffold, but I don't have the next facebook yet.
                        Someone please help. I don't have much time left and I'd
                        like to have at least a few billion dollars by the end of
                        business tomorrow. Kthxbye.")
   q2 = FactoryGirl.create(:question, title: "Helpdesk? More like NO help desk. My email still won't go.",
                        description: "When I find myself in times of trouble, mother
                        mary comes to me. Speaking words of wisdom, let it be. And in
                        my hour of darkness, she is standing right in front of me. Speaking
                        words of wisdom, let it be. Am I right?")
    visit '/questions'

    expect(page).to have_content 'All Questions'
    expect(page).to have_content q1.title
    expect(page).to have_content q2.title
    expect("Helpdesk").to appear_before("ASAP")
  end
end
