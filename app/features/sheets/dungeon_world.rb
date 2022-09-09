# frozen_string_literal: true

class Sheets::DungeonWorld < Dry::Struct
  Dice = Types::String.enum('d4', 'd6', 'd8', 'd10', 'd12')

  attribute :max_hit_points, Types::Integer
  attribute :damage, Dice
end
