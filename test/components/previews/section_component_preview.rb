# frozen_string_literal: true

class SectionComponentPreview < Preview
  def with_content_block
    render SectionComponent.new do
      'Hello'
    end
  end
end
