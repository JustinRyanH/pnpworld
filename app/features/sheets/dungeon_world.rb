# frozen_string_literal: true

class Sheets::DungeonWorld
  class Stats
    include ActiveModel::Model

    attr_accessor :charisma, :wisdom, :intelligence, :constitution, :dexterity, :strength
  end
  include ActiveModel::Model

  attr_accessor :max_hit_points, :level, :damage, :stats
end
