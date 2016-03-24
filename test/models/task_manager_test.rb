require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    task_manager.create({
      :title       => "a title",
      :description => "a description"
      })

      task = task_manager.find(1)
      assert_equal "a title", task.title
      assert_equal "a description", task.description
      assert_equal 1, task.id
  end

  def test_it_reads_all_tasks
    task_manager.create({
      :title       => "first",
      :description => "first description"
      })
    task_manager.create({
      :title       => "second",
      :description => "second description"
      })
    task_manager.create({
      :title       => "third",
      :description => "third description"
      })
    task_manager.create({
      :title       => "fourth",
      :description => "fourth description"
      })
    task4 = task_manager.all
    assert_equal 4, task4.size
  end
    
  def test_it_updates_a_task
    task_manager.create({
      :title       => "fourth",
      :description => "fourth description"
      })
    task1 = task_manager.find(1)
    assert_equal "fourth", task1.title

    task_manager.update(1, {title: "fifth"})
    task1 = task_manager.find(1)
    assert_equal "fifth", task1.title
  end

  def test_it_destroys_a_task
    task_manager.create({
      :title       => "first",
      :description => "first description"
      })
    task_manager.create({
      :title       => "second",
      :description => "second description"
      })

      task3 = task_manager.all
      assert_equal 2, task3.size
      task_manager.delete(2)
      task3 = task_manager.all
      assert_equal 1, task3.size
  end
end
