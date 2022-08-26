# frozen_string_literal: true

require "test_helper"

class HeaderComponentTest < ViewComponent::TestCase
  def test_with_just_content
    render_preview(:header_with_content)

    assert_selector('h1', text: "Heading 1")
  end

  def test_header_level_2
    render_preview(:header_with_level_2)

    assert_selector('h2', text: "Heading 2")
  end
end
