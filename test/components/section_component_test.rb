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
    render_inline(SectionComponent.new(title: "A Title")) { "Hello World" }
    header = page.find('h1')
    section = page.find('section')

    assert_equal 'a-title', header[:id]
    assert_equal 'a-title', section['aria-labelledby']

    assert_selector('h1', text: 'Title')
  end
end
