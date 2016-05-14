require 'rails_helper'

feature "deletes question" do
  scenario "user deletes a question from edit page" do
    visit questions_path
    user = create(:user)
    login_as(user, scope: :user)

    question = Question.create(title: "#{'title' * 40}", description: "#{'a'* 150}", creator: user)
    visit question_path(question)

    click_link("Edit Question")

    click_link("Delete Question")

    expect(page).to_not have_content("#{'title' * 40}")
  end

  scenario "user deletes a question from details page" do
    visit questions_path
    user = create(:user)
    user2 = create(:user)
    login_as(user, scope: :user)

    question = Question.create(title: "#{'title' * 40}", description: "#{'a'* 150}", creator: user)
    Answer.create(question: question, reply: "#{'z' * 60}", user: user2)
    visit question_path(question)

    click_link("Delete Question")

    expect(page).to_not have_content("#{'title' * 40}")
    expect(question.answers).to eq([])
  end
end
