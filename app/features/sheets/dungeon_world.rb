# frozen_string_literal: true

module Sheets
  class DungeonWorld
    class Stat
      include ActiveModel::API

      attr_accessor :value

      def as_json
        value
      end
    end

    class Stats
      include ActiveModel::API
      extend Sheets::AttrStat

      attr_stat Stat, :charisma, :wisdom, :intelligence, :constitution, :dexterity, :strength
    end
    include ActiveModel::API

    attr_accessor :max_hit_points, :level, :damage, :stats
  end
end
