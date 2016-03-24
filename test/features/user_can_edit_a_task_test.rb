require_relative '../test_helper'

class UserCreatesATask < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_edit_existing_task
    visit '/'
    click_link("New Task")
    fill_in("task[title]", with: "Learn capybara")
    fill_in("task[description]", with: "Learn it real fast!")
    click_button("LETS GO!")
    assert '/tasks', current_path

    click_link("edit!")
    fill_in("task[title]", with: "Learn Capybara Now!")
    click_button("GO!")

    assert '/tasks/1', current_path

    within(".navbar-brand") do
      assert page.has_content?("Learn Capybara Now!")
    end
  end
end
