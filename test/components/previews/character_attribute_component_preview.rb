# frozen_string_literal: true

class CharacterAttributeComponentPreview < ViewComponent::Preview
  def default
    render(CharacterAttributeComponent.new)
  end
end
