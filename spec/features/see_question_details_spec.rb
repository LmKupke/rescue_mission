require "rails_helper"

feature "see question" do
  scenario "see details about posted question" do
    user1 = FactoryGirl.create(:user)

    question2 = Question.create!(title:"Why is rails becoming a lot easier? Launch teaching or just getting it", description: "I was wondering why rails was becoming a lot easier? Is it because the articles make sense now?", creator: user1)
    visit questions_path
  
    expect(page).to have_content(question2.title)
    click_link "#{question2.title}"
    expect(page).to have_content(question2.title)
    expect(page).to have_content(question2.description)
  end
end
