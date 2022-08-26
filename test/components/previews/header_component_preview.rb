# frozen_string_literal: true

class HeaderComponentPreview < Preview
  def header_with_content
    render HeaderComponent.new do
      'Heading 1'
    end
  end
end
