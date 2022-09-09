# frozen_string_literal: true

module DungeonWorld
  class Stats
    include ActiveModel::API
    extend AttrStat

    attr_stat DungeonWorld::Stat, :charisma, :wisdom, :intelligence, :constitution, :dexterity, :strength
  end
end
