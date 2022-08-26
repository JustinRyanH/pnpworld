# frozen_string_literal: true

class HeaderComponent < ViewComponent::Base
  def initialize(level: 1, classname: nil, id: nil)
    @level = level
    @classname = classname
    @id = id
  end

  private

  attr_reader :level

  def className
    case level
    when 1 then 'text-5xl font-extrabold'
    when 2 then 'text-4xl font-bold'
    when 3 then 'text-3xl font-bold'
    when 4 then 'text-2xl font-bold'
    when 5 then 'text-xl font-bold'
    when 6 then 'text-lg font-bold'
    end
  end

  def tag
    case level
    when 1 then 'h1'
    when 2 then 'h2'
    when 3 then 'h3'
    when 4 then 'h4'
    when 6 then 'h6'
    end
  end

  def extraClass
    return '' if @classname.nil?
    " #{@classname}"
  end

  def id
    return '' unless @id.present?
    "id=\"#{@id}\"".html_safe
  end
end
