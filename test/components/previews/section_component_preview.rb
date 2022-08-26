class SectionComponentPreview < ViewComponent::Preview
  def with_content_block
    render SectionComponent.new do
      "Hello"
    end
  end
end