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

      def self.attr_stat(kind, *attrs)
        attrs.each do |attr|
          instance_for_attr = "@#{attr}"

          define_method(attr) do
            instance_variable_get(instance_for_attr)
          end

          define_method("#{attr}=") do |arg|
            return instance_variable_set(instance_for_attr, arg) if arg.is_a? kind

            instance_variable_set(instance_for_attr, kind.new(value: arg))
          end
        end
      end

      attr_stat  Stat,:charisma, :wisdom, :intelligence, :constitution, :dexterity, :strength
    end
    include ActiveModel::API

    attr_accessor :max_hit_points, :level, :damage, :stats
  end
end
