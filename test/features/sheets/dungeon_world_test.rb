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
    assert_equal(8, @example_sheet.stats.charisma)
    assert_equal(9, @example_sheet.stats.wisdom)
    assert_equal(12, @example_sheet.stats.intelligence)
    assert_equal(13, @example_sheet.stats.constitution)
    assert_equal(15, @example_sheet.stats.dexterity)
    assert_equal(16, @example_sheet.stats.strength)
  end
end
