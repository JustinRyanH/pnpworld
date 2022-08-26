# frozen_string_literal: true

require "test_helper"

class SectionComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    render_inline(SectionComponent.new) { "Hello World" }

    assert_text("Hello World")
  end
end
