require 'test_helper'

module DungeonWorld
  class StatTest < ActiveSupport::TestCase

    test "value is required" do
      example_no_value = DungeonWorld::Stat.new
      refute example_no_value.valid?
      assert example_no_value.errors[:value]
    end
  end
end
