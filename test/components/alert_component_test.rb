# frozen_string_literal: true

require "test_helper"

class AlertComponentTest < ViewComponent::TestCase
  def test_alert_default_component
    render_preview(:alert_default)

    assert_selector('[role="alert"]', text: /Alert Message/)
    assert_selector('[role="alert"]', text: /Info/)
  end

  def test_alert_danger_component
    render_preview(:alert_danger)

    assert_selector('[role="alert"]', text: /Danger Alert Message/)
    assert_selector('[role="alert"]', text: /Critical!/)
  end

  def test_alert_success_component
    render_preview(:alert_success)

    assert_selector('[role="alert"]', text: /Successful Alert Message/)
    assert_selector('[role="alert"]', text: /Success!/)
  end

  def test_alert_success_component
    render_preview(:alert_warning)

    assert_selector('[role="alert"]', text: /Warning Alert Message/)
    assert_selector('[role="alert"]', text: /Warning!/)
  end
end
