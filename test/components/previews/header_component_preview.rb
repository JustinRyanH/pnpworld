# frozen_string_literal: true

class HeaderComponentPreview < Preview
  def header_with_content
    render HeaderComponent.new do
      'Hello World'
    end
  end
end
