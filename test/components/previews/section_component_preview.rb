# frozen_string_literal: true

class SectionComponentPreview < Preview
  def with_content_block
    render SectionComponent.new do
      '<p>Paragraph</p>'.html_safe
    end
  end
  def with_extra_class
    render SectionComponent.new(classname: "drop-shadow-xl bg-amber-200/10") do
      '<p>Paragraph</p>'.html_safe
    end
  end

  def with_accessible_label_id
  end
end
