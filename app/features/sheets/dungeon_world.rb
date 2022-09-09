# frozen_string_literal: true

class Sheets::DungeonWorld < Dry::Struct
  Dice = Types::String.enum('d4', 'd6', 'd8', 'd10', 'd12')

  attribute :max_hit_points, Types::Integer
  attribute :level, Types::Integer
  attribute :damage, Dice
  attribute :stats do
    attribute :strength, Types::Integer
    attribute :dexterity, Types::Integer
    attribute :constitution, Types::Integer
    attribute :intelligence, Types::Integer
    attribute :wisdom, Types::Integer
    attribute :charisma, Types::Integer
  end
end
