# frozen_string_literal: true

class SectionComponent < ViewComponent::Base
  include ClassHelper

  def initialize(classname: '', label_id: nil, center: false, data: nil)
    @classname = classname
    @label_id = label_id
    @center = center
    @data = data
  end

  private

  attr_reader :label_id, :data

  def labelled_by
    return nil if @label_id.nil?
    "aria-labelledby=\"#{@label_id}\"".html_safe
  end

  def classname
    @classname + center_css
  end

  def center_css
    return "" unless @center
    " container mx-auto"
  end
end
