require "rails_helper"

feature "see question" do
  scenario "see details about posted question" do
    user1 = create(:user)

    question2 = Question.create!(title:"#{'a'* 40}", description: "#{'b' * 150}", creator: user1)
    visit questions_path

    expect(page).to have_content(question2.title)
    click_link "#{question2.title}"
    expect(page).to have_content(question2.title)
    expect(page).to have_content(question2.description)
  end
end
