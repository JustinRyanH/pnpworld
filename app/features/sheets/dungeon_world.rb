# frozen_string_literal: true

class Sheets::DungeonWorld

  class Stats
    include ActiveModel::API
    extend Sheets::AttrStat

    attr_stat Sheets::DungeonWorld::Stat, :charisma, :wisdom, :intelligence, :constitution, :dexterity, :strength
  end

  include ActiveModel::API

  attr_accessor :max_hit_points, :level, :damage, :stats
end
