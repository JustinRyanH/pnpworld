# frozen_string_literal: true

module ClassHelper
  def classname
    @classname
  end

  def extraClasses
    return '' if classname.nil?

    " #{classname}"
  end
end
