# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :footer

  # @param [Boolean] has_close_button adds the close button to the header
  def initialize(
    has_close_button: true,
    label_id: nil,
    id: nil,
    panel_class: '',
    close_to: nil,
    position: :center,
    mobile_position: :bottom
  )
    @id = id
    @has_close_button = has_close_button
    @label_id = label_id
    @panel_class = panel_class
    @close_to = close_to
    @position = position.to_sym
    @mobile_position = mobile_position.to_sym
  end

  private

  attr_reader :has_close_button, :label_id, :id, :close_to, :position, :mobile_position

  def panel_class
    "#{content_position} #{@panel_class}"
  end

  def content_position
    [position_class, 'p-4', mobile_position_class, 'sm:p-0'].join(' ')
  end

  def position_class
    return 'sm:items-start' if position == :top
    return 'sm:items-center' if position == :middle
    return 'sm:items-end' if position == :bottom

    'sm:items-center'
  end

  def mobile_position_class
    return 'items-start' if mobile_position == :top
    return 'items-center' if mobile_position == :middle
    return 'items-end' if mobile_position == :bottom

    'items-end'
  end
end
