# frozen_string_literal: true

require "test_helper"

class HeaderComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    render_preview(:header_with_content)

    assert_selector('h1', text: "Heading 1")
  end
end
