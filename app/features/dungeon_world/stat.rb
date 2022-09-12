# frozen_string_literal: true

module DungeonWorld
  class Stat
    include ActiveModel::API

    validates :name, presence: true
    validates :value, presence: true, numericality: {
      only_integer: true,
      less_than_or_equal_to: 18,
      greater_than_or_equal_to: 3
    }

    attr_accessor :value, :name

    # The Modifier for the given stat based on it's total value
    #
    # @return [Integer]
    def modifier
      case value
      when 1..3 then -3
      when 4..5 then -2
      when 6..8 then -1
      when 9..12 then 0
      when 13..15 then 1
      when 16..17 then 2
      when 18 then 3
      end
    end

    def as_json
      value
    end
  end
end
