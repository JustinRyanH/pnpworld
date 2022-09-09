# frozen_string_literal: true

require 'test_helper'

class DungeonWorldTest < Minitest::Test
  def test_struct
    struct = Sheets::DungeonWorld.new(
      max_hit_points: 10,
      damage: 'd8'
    )

    assert_equal(10, struct.max_hit_points)
    assert_equal('d8', struct.damage)
  end
end
