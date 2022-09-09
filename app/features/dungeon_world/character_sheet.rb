# frozen_string_literal: true

module DungeonWorld
  class CharacterSheet
    include ActiveModel::API

    attr_accessor :max_hit_points, :level, :damage, :stats
  end
end
