require "rails_helper"

feature "see questions" do
  scenario "see recently posted questions" do
    user1 = create(:user)
    user2 = create(:user, name: "Jack Smith", email: "example@gmail.com")
    question = Question.create(title:"How to I create a Gemfile? New to rails!!", description: "HI I am new to rails and I was wondering how I create a Gemfile?? Do I create it myself or is it auto-generated?", creator: user2)
    question2 = Question.create(title:"Why is rails becoming a lot easier? Launch teaching or just getting it", description: "I was wondering why rails was becoming a lot easier? Is it because the articles make sense now?", creator: user1)

    visit questions_path
    expect(page).to have_content(question2.title)
    expect(page).to have_content(question.title)

  end
end
