require 'rails_helper'

feature "edits question" do
  scenario "user successfully edits a question" do
    visit questions_path
    user = create(:user)
    login_as(user, scope: :user)

    question = Question.create(title: "#{'title' * 40}", description: "#{'a'* 150}", creator: user)
    visit question_path(question)

    click_link("Edit Question")

    fill_in "Title", with: "#{'newtitle' * 40}"
    click_button("Update Question")

    expect(page).to have_content("#{'newtitle' * 40}")
  end

  scenario "user unsuccessfully edits a question" do
    visit questions_path
    user = create(:user)
    login_as(user, scope: :user)
    question = Question.create(title: "#{'title' * 40}", description: "#{'a'* 150}", creator: user)

    visit question_path(question)

    click_link("Edit Question")

    fill_in "Title", with: " "
    click_button("Update Question")

    expect(page).to have_content("Title needs to be at least 40 characters")
    expect(page).to have_button("Update Question")
  end
end
