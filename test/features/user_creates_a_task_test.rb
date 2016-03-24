require_relative '../test_helper'

class UserCreatesATask < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_create_new_task
    visit '/'

    click_link("New Task")

    fill_in("task[title]", with: "New Task!")
    fill_in("task[description]", with: "This is the description for my task!")

    click_button("LETS GO!")

    assert '/tasks', current_path

    within(".list-group-item") do
      assert page.has_content?("New Task!")
    end
  end

end
