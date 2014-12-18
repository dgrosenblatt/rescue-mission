require 'rails_helper'

feature 'Write questions and answers with markdown' do
  # As a user
  # I want to write my questions and answers with markdown
  # So I can easily format my questions and answers
  #
  # Acceptance Criteria
  #
  # - I can write my questions and answers using markdown syntax
  # - Questions and answers, when shown, should be the HTML rendered from the
  # markdown
   scenario 'submitting a question with markdown' do
    visit '/questions/new'
    fill_in "Title", with: ("It would really be great if markdown was supported.")
    fill_in "Description", with: "Um *Guys this is a really big problem
                                  for me.* **Please someone let me know if you have
                                  an answer to my problem ASAP ASAP!!** Whenver I
                                  attempt to connect to the internet via wi fi, some
                                  thing really weird happens. I just don't get it, but
                                  it disconnects me automatically. It is driving me
                                  absolutely insane."

    click_on 'Create Question'
    visit '/questions'
    click_on "It would really be great if markdown was supported."

    expect(page).to have_css('em')
    expect(page).to have_css('strong')
  end

  scenario 'submitting an answer with markdown' do
    @question = FactoryGirl.create(:question)
    visit "/questions/#{@question.id}"
    fill_in "Answer this question", with: "Dude, that question is so **lame**. I
                                           cannot believe you haven't been
                                           *banned* from this website yet!"
    click_on "Save Answer"

    expect(page).to have_css('em')
    expect(page).to have_css('strong')
  end
end
