# frozen_string_literal: true

require 'test_helper'

class DungeonWorldTest < ActiveSupport::TestCase
  setup do
    @example_sheet = Sheets::DungeonWorld.new(
      max_hit_points: 10,
      damage: 'd8',
      level: 1,
      stats: Sheets::DungeonWorld::Stats.new(
        charisma: 8,
        wisdom: 9,
        intelligence: 12,
        constitution: 13,
        dexterity: 15,
        strength: 16
      )
    )
  end

  test "attributes" do
    assert_equal(10, @example_sheet.max_hit_points)
    assert_equal('d8', @example_sheet.damage)
    assert_equal(1, @example_sheet.level)
  end

  test "stats" do
    assert_equal(8, @example_sheet.stats.charisma.value)
  end

  test "as_json" do
    expected_hash = {
      "max_hit_points" => 10,
      "level" => 1,
      "damage" => "d8",
      "stats" => {
        "strength" => 16,
        "dexterity" => 15,
        "constitution" => 13,
        "intelligence" => 12,
        "wisdom" => 9,
        "charisma" => 8
      }
    }
    assert_equal(expected_hash, @example_sheet.as_json)
  end
end
