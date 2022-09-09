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

    def self.attr_stat(*attrs)
      attrs.each do |attr|
        define_method(attr) do
          instance_variable_get("@#{attr}")
        end

        define_method("#{attr}=") do |arg|
          return instance_variable_set("@#{attr}", arg) if arg.is_a? Stat
          instance_variable_set("@#{attr}", Stat.new(value: arg))
        end
      end
    end

    attr_stat :charisma
  end
  include ActiveModel::API

  attr_accessor :max_hit_points, :level, :damage, :stats
end
