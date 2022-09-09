require "test_helper"

class DungeonWorldTest < Minitest::Test
  def test_struct
    struct = Sheets::DungeonWorld.new(max_hit_points: 10)
    assert_equal(10, struct.max_hit_points)
  end
end
