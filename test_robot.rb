require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    robot = Robot.new
    robot.foreign_model = "baymax"
    robot.needs_repairs = "drunk"
    # act
    station = robot.station
    # assert
    assert_equal(1, station)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    robot = Robot.new
    robot.vintage_model = "baymax"
    robot.needs_repairs = "drunk"
    # act
    station = robot.station
    # assert
    assert_equal(2, station)

  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    robot = Robot.new
    robot.needs_repairs = "drunk"
    # act
    station = robot.station
    # assert
    assert_equal(3, station)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    robot = Robot.new
    # act
    station = robot.station
    # assert
    assert_equal(4, station)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    robot = Robot.new
    # act
    prioritize = robot.prioritize_tasks
    # assert
    assert_equal(-1, prioritize)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot = Robot.new
    robot.todos = ["Clean room", "Buy groceries", "Do some more coding"]
    # act
    prioritize = robot.prioritize_tasks
    # assert
    assert_equal("Do some more coding", prioritize)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    robot = Robot.new
    robot.day_off = "Saturday"
    # assert
    assert_equal(false, robot.workday?("Saturday"))
  end

  def test_workday_not_day_off_returns_true
    # arrange
    robot = Robot.new
    robot.day_off = "Saturday"
    # assert
    assert_equal(true, robot.workday?("Monday"))
  end

end
