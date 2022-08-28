class NavbarButtonComponentPreview < ViewComponent::Preview
  layout 'preview'
  def navbar_default
    render NavbarButtonComponent.new do
      "Button"
    end
  end

  def navbar_active_button
    render NavbarButtonComponent.new(active: true) do
      "Button"
    end
  end

  def navbar_link
    render NavbarButtonComponent.new(href: "https://example.com") do
      "Button"
    end
  end
end
