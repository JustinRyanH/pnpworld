# frozen_string_literal: true

class CharacterStatComponent < ViewComponent::Base
  #
  # @param [DungeonWorld::Stat] attribute
  def initialize(attribute:)
    super
    @attribute = attribute
  end

  private

  def name
    @attribute.name
  end

  def abbreviation
    'WIS'
  end

  def stat
    @attribute.value
  end

  def modifier
    return @attribute.modifier if @attribute.modifier <= 0

    "+#{@attribute.modifier}"
  end

  def debility
    'confused'
  end
end
