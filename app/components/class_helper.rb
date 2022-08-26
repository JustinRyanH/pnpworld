# frozen_string_literal: true

module ClassHelper
  def extraClasses
    return '' if @classname.nil?

    " #{@classname}"
  end
end
