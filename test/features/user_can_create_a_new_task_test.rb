require_relative "../test_helper"

class UserCanCreateANewTaskTest < FeatureTest
  def test_user_creates_task
    visit '/'

    click_link "New Task"

    assert_equal '/task/new', current_path

    fill_in 'task[title]', with: "Learn Capybara"
    fill_in 'task[description]', with: "Capybara and Launchy fun time."
    click_button "bootun"

    within(".task-1") do
    assert page.has_content?("Learn Capybara")
    end
  end
end
