require "rails_helper"

feature "see questions" do
  scenario "see recently posted questions" do
    user1 = create(:user)
    user2 = create(:user, name: "Jack Smith", email: "example@gmail.com")
    question = Question.create(title:"How to I create a Gemfile? New to rails!!", description: "#{'z' * 150}", creator: user2)
    question2 = Question.create(title:"Why is rails becoming a lot easier? Launch teaching or just getting it", description: "#{'x' * 150}", creator: user1)

    visit questions_path
    expect(page).to have_content(question2.title)
    expect(page).to have_content(question.title)

  end
end
