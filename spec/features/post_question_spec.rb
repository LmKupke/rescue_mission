require "rails_helper"

feature "post a question" do
  scenario "user signs in and goes to new question page" do
    user = FactoryGirl.create(:user)
    visit root_path
    login_as(user, scope: :user)
    click_link "Sign in with Facebook"
    click_link "New Question"

    expect(page).to have_content("Create a New Question")
  end

  scenario "signed in user creates a question" do
    user = FactoryGirl.create(:user)
    visit  root_path
    login_as(user, scope: :user)
    click_link "Sign in with Facebook"
    click_link "New Question"

    fill_in "Title", with: "#{'a' * 50}"
    fill_in "Description", with: "#{'b' * 150}"
    click_on "Create Question"
    expect(page).to have_link("#{'a' * 50}")
  end

  scenario "signed in user does not fill in question fields" do
    user = FactoryGirl.create(:user)
    visit  root_path
    login_as(user, scope: :user)
    click_link "Sign in with Facebook"
    click_link "New Question"

    fill_in "Title", with: " "
    fill_in "Description", with: " "
    click_on "Create Question"
    
    expect(page).to have_content("Create a New Question")
    expect(page).to have_content("Title needs to be at least 40 characters")
    expect(page).to have_content("Description needs to be at least 150 characters")

  end
end
