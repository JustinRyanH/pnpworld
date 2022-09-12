# frozen_string_literal: true

class CharacterStatComponentPreview < ViewComponent::Preview
  def default
    render(CharacterStatComponent.new(attribute: DungeonWorld::Stat.new(name: 'wisdom', value: 14)))
  end
end
