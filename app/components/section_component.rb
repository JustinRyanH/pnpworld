# frozen_string_literal: true

class SectionComponent < ViewComponent::Base
  include ClassHelper

  def initialize(classname: nil, label_id: nil)
    @classname = classname
    @label_id = label_id
  end

  def labelled_by
    return nil if @label_id.nil?
    "aria-labelledby=\"#{@label_id}\"".html_safe
  end
end
