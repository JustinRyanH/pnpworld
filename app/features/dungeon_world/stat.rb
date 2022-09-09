# frozen_string_literal: true

module DungeonWorld
  class Stat
    include ActiveModel::API

    validates :value, presence: true, numericality: { only_integer: true }

    attr_accessor :value

    def as_json
      value
    end
  end
end
