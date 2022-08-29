class AlertComponentPreview < ViewComponent::Preview
  layout 'preview'
  def alert_default
    render AlertComponent.new do
      "Alert Message"
    end
  end
end
