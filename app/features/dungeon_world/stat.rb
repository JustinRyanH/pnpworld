# frozen_string_literal: true

module DungeonWorld
  class Stat
    include ActiveModel::API

    attr_accessor :value

    def as_json
      value
    end
  end
end
