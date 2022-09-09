# frozen_string_literal: true

class Sheets::DungeonWorld
  class Stat
    include ActiveModel::API

    attr_accessor :value

    def as_json
      value
    end
  end
  class Stats
    include ActiveModel::API

    attr_accessor :wisdom, :intelligence, :constitution, :dexterity, :strength

    def charisma=(value)
      @charisma = Stat.new(value: value)
    end

    def charisma
      @charisma
    end
  end
  include ActiveModel::API

  attr_accessor :max_hit_points, :level, :damage, :stats
end
