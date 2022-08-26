# frozen_string_literal: true

class HeaderComponentPreview < Preview
  def header_with_content
    render HeaderComponent.new do
      'Heading 1'
    end
  end

  def header_with_level_2
    render HeaderComponent.new(level: 2) do
      'Heading 2'
    end
  end

  def header_with_level_3
    render HeaderComponent.new(level: 3) do
      'Heading 3'
    end
  end

  def header_with_level_4
    render HeaderComponent.new(level: 4) do
      'Heading 4'
    end
  end

  def header_with_level_5
    render HeaderComponent.new(level: 5) do
      'Heading 5'
    end
  end

  def header_with_level_5
    render HeaderComponent.new(level: 6) do
      'Heading 6'
    end
  end

  def header_with_extra_classes
    classname = "bg-amber-700/20 m-2 p-2 rounded-xl shadow-xl"
    render HeaderComponent.new(classname: "#{classname}") do
      'Header with Extra Classes'
    end
  end

  def header_with_identifier
    render HeaderComponent.new(id: 'example-id') do
      'With Id'
    end
  end
end
