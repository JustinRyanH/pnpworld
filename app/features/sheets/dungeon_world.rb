require 'dry-struct'

module Types
  include Dry.Types()
end

class Sheets::DungeonWorld < Dry::Struct
  attribute :max_hit_points, Types::Integer
  attribute :damage, Types::String
end