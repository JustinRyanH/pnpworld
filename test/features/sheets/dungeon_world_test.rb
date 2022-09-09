# frozen_string_literal: true

require 'test_helper'

class DungeonWorldTest < Minitest::Test
  def test_struct
    struct = Sheets::DungeonWorld.new(
      max_hit_points: 10,
      damage: 'd8',
      level: 1,
      stats: {
        strength: 16,
        dexterity: 15,
        constitution: 13,
        intelligence: 12,
        wisdom: 9,
        charisma: 8
      }
    )

    assert_equal(10, struct.max_hit_points)
    assert_equal('d8', struct.damage)
    assert_equal(1, struct.level)
    assert_equal(8, struct.stats.charisma)
    assert_equal(9, struct.stats.wisdom)
    assert_equal(12, struct.stats.intelligence)
    assert_equal(13, struct.stats.constitution)
    assert_equal(15, struct.stats.dexterity)
    assert_equal(16, struct.stats.charisma)
  end
end
