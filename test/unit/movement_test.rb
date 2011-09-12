# encoding: UTF-8
require 'test_helper'

class MovementTest < ActiveSupport::TestCase

  test "movement attributes must not be empty" do
    movement = Movement.new
    assert movement.invalid?
    assert movement.errors[:flow].any?
    assert movement.errors[:account].any?
    assert movement.errors[:value].any?
    assert movement.errors[:date].any?
  end
  
  test "movement flow must not be empty" do
    movement = Movement.new
    assert movement.invalid?
    assert_equal "is not included in the list; can't be blank" , movement.errors[:flow].join('; ' )
  end
  
  test "movement account must not be empty" do
    movement = Movement.new
    assert movement.invalid?
    assert_equal "can't be blank" , movement.errors[:account].join('; ' )
  end
  
  test "movement value must not be empty" do
    movement = Movement.new
    assert movement.invalid?
    assert_equal "can't be blank; is not a number" , movement.errors[:value].join('; ' )
  end
  
  test "movement date must not be empty" do
    movement = Movement.new
    assert movement.invalid?
    assert_equal "can't be blank" , movement.errors[:date].join('; ' )
  end
  
  test "movement value must be numericality" do
    movement = Movement.new
    movement.value = "aaa"  
    assert movement.invalid?
    assert_equal "is not a number" , movement.errors[:value].join('; ' )
  end
  
  test "movement flow must be valid" do
    movement = Movement.new
    movement.flow = "Fluxo não conhecido"
    assert movement.invalid?
    assert_equal "is not included in the list" , movement.errors[:flow].join('; ' )
  end
  
  test "movement value must be greater than zero" do
    movement = Movement.new
    movement.value = 0.0
    assert movement.invalid?
    assert_equal "must be greater than 0.0" , movement.errors[:value].join('; ' )
  end
  
end
