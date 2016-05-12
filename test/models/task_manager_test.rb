require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers
  def test_it_creates_a_task
    task_id = task_manager.create({
      :title       => "a title",
      :description => "a description"
    })

    task = task_manager.find(task_id)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal task_id, task.id
  end

  # def test_it_can_find_tasks
  #   task_manager.create({
  #     :title       => "a title",
  #     :description => "a description"
  #   })
  #   task_manager.create({
  #      :title       => "another title",
  #      :description => "another description"
  #   })
  #
  #   task = task_manager.find(2)
  #   assert_equal "another title", task.title
  #   assert_equal "another description", task.description
  #   assert_equal 2, task.id
  # end

  def test_it_can_return_all_tasks
    task_manager.create({
      :title       => "a title",
      :description => "a description"
    })
    task_manager.create({
       :title       => "another title",
       :description => "another description"
    })

    assert_equal 2, task_manager.all.count
    assert_equal Task, task_manager.all[0].class
  end

  def test_it_can_update_tasks
    task_id = task_manager.create({
      :title       => "a title",
      :description => "a description"
    })
    task_manager.update(task_id, {title: "NOT TDD"} )

    task = task_manager.find(task_id)

    assert_equal "NOT TDD", task.title
  end
  # 
  # def test_it_can_destroy_a_task
  #   task_manager.create({
  #     :title       => "a title",
  #     :description => "a description"
  #   })
  #
  #   assert_equal 1, task_manager.all.count
  #
  #   task_manager.destroy(1)
  #
  #   assert_equal 0, task_manager.all.count
  # end
end
