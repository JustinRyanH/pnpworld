# frozen_string_literal: true

require "test_helper"

class AlertComponentTest < ViewComponent::TestCase
  def test_alert_default_component
    render_preview(:alert_default)

    assert_selector('[role="alert"]', text: /Alert Message/)
  end
end
