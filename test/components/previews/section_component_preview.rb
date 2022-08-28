# frozen_string_literal: true

class SectionComponentPreview < ViewComponent::Preview
  layout 'preview'
  def section_with_content_block
    render SectionComponent.new do
      '<p>Paragraph</p>'.html_safe
    end
  end
  def section_with_extra_class
    render SectionComponent.new(classname: "drop-shadow-xl bg-amber-200/10") do
      '<p>Paragraph</p>'.html_safe
    end
  end

  def section_with_center
    render SectionComponent.new(classname: "drop-shadow-xl bg-amber-200/10", center: true) do
      '<p>Paragraph</p>'.html_safe
    end
  end

  def section_with_accessible_label_id
  end
end
