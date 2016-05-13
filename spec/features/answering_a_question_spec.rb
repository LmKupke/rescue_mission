require 'rails_helper'

feature "post an answer" do
  scenario "non question asking user sees Answer form" do
    user = create(:user)
    user2 = create(:user)
    login_as(user2, scope: :user)
    question = Question.create(title: "#{'a' * 40}", description: "#{'z' * 150}", creator: user)
    visit question_path(question)

    expect(page).to have_css('#answer_reply')

  end

  scenario "non question asking user adds Answer" do
    user = create(:user)
    user2 = create(:user)
    login_as(user2, scope: :user)
    question = Question.create(title: "#{'a' * 40}", description: "#{'z' * 150}", creator: user)
    visit question_path(question)

    fill_in("Answer:", with: "#{'answer' * 50}")

    click_on "Create Answer"
    expect(page).to have_content("#{'answer' * 50}")
  end

  scenario "non question asking user adds invalid Answer" do
    user = create(:user)
    user2 = create(:user)
    login_as(user2, scope: :user)
    question = Question.create(title: "#{'a' * 40}", description: "#{'z' * 150}", creator: user)
    visit question_path(question)

    fill_in("Answer:", with: " ")

    click_on "Create Answer"
    expect(page).to have_content("Reply needs to be at least 50 characters")
  end
end
