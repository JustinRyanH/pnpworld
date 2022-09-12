# frozen_string_literal: true

require 'test_helper'

module DungeonWorld
  class StatTest < ActiveSupport::TestCase
    test 'value is required' do
      example_no_value = DungeonWorld::Stat.new(name: 'strength')
      refute example_no_value.valid?
      assert example_no_value.errors[:value]
    end

    test 'name is required' do
      example_no_value = DungeonWorld::Stat.new(value: 10)
      refute example_no_value.valid?
      assert example_no_value.errors[:name]
    end

    test 'value is a integer' do
      value_as_float = DungeonWorld::Stat.new(value: 3.5, name: 'strength')
      refute value_as_float.valid?
      assert value_as_float.errors[:value]
    end

    test 'value must be between 3 and 18' do
      value_low = DungeonWorld::Stat.new(value: 2, name: 'strength')
      refute value_low.valid?

      high_value = DungeonWorld::Stat.new(value: 19, name: 'strength')
      refute high_value.valid?
    end

    test 'modifier' do
      minus_three = DungeonWorld::Stat.new(value: 3, name: 'strength')
      assert_equal -3, minus_three.modifier
      minus_two = DungeonWorld::Stat.new(value: 5, name: 'strength')
      assert_equal -2, minus_two.modifier
      minus_one = DungeonWorld::Stat.new(value: 8, name: 'strength')
      assert_equal -1, minus_one.modifier
      zero_low = DungeonWorld::Stat.new(value: 9, name: 'strength')
      assert_equal 0, zero_low.modifier
      zero_height = DungeonWorld::Stat.new(value: 12, name: 'strength')
      assert_equal 0, zero_height.modifier
      plus_one = DungeonWorld::Stat.new(value: 15, name: 'strength')
      assert_equal 1, plus_one.modifier
      plus_two = DungeonWorld::Stat.new(value: 17, name: 'strength')
      assert_equal 2, plus_two.modifier
      plus_three = DungeonWorld::Stat.new(value: 18, name: 'strength')
      assert_equal 3, plus_three.modifier
    end
  end
end
