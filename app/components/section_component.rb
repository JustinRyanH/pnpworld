# frozen_string_literal: true

class SectionComponent < ViewComponent::Base
  attr_reader :title

  def initialize(title: nil)
    @title = title
  end

  private

  def title_id
    return nil unless title.present?
    title.split(' ').join('-').downcase
  end

  def labelled_by
    return "" unless title.present?
    "aria-labelledby=\"#{title_id}\"".html_safe
  end
end