class NavbarButtonComponentPreview < Preview
  def navbar_default
    render NavbarButtonComponent.new do
      "Button"
    end
  end
end
