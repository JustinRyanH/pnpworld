# frozen_string_literal: true

require "test_helper"

class SectionComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    render_inline(SectionComponent.new) { "Hello World" }
    section = page.find('section')

    assert_text("Hello World")
    assert_equal nil, section['aria-labelledby']
  end

  def test_rendering_accessible_title
    render_inline(SectionComponent.new(label_id: 'a-label')) { "Hello World" }
    section = page.find('section')
    assert_equal 'a-label', section['aria-labelledby']
  end
end
