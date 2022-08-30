# frozen_string_literal: true

require "test_helper"

class ModalComponentTest < ViewComponent::TestCase
  def test_can_be_labelled_by_header
    render_preview(:modal_with_body_header)

    assert_selector('[role="dialog"][aria-labelledby="label-id"]')
    assert_selector('h1#label-id')
  end
end
