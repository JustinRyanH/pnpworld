class AlertComponentPreview < ViewComponent::Preview
  layout 'preview'
  def alert_default
    render AlertComponent.new do
      "Alert Message"
    end
  end

  def alert_danger
    render AlertComponent.new(kind: :danger) do
      "Danger Alert Message"
    end
  end

  def alert_success
    render AlertComponent.new(kind: :success) do
      "Successful Alert Message"
    end
  end

  def alert_warning
    render AlertComponent.new(kind: :warning) do
      "Warning Alert Message"
    end
  end
end
