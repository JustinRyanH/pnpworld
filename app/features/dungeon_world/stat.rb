# frozen_string_literal: true

module DungeonWorld
  class Stat
    include ActiveModel::API

    validates :value, presence: true, numericality: {
      only_integer: true,
      less_than_or_equal_to: 18,
      greater_than_or_equal_to: 3
    }

    attr_accessor :value

    def as_json
      value
    end
  end
end
