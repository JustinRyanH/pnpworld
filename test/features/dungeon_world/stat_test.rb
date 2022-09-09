# frozen_string_literal: true

require 'test_helper'

module DungeonWorld
  class StatTest < ActiveSupport::TestCase
    test 'value is required' do
      example_no_value = DungeonWorld::Stat.new
      refute example_no_value.valid?
      assert example_no_value.errors[:value]
    end

    test 'value is a integer' do
      value_as_float = DungeonWorld::Stat.new(value: 3.5)
      refute value_as_float.valid?
      assert value_as_float.errors[:value]
    end

    test 'value must be between 3 and 18' do
      value_low = DungeonWorld::Stat.new(value: 2)
      refute value_low.valid?

      high_value = DungeonWorld::Stat.new(value: 19)
      refute high_value.valid?
    end
  end
end
