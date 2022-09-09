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
    @position = position
    @mobile_position = mobile_position
  end

  private

  attr_reader :has_close_button, :label_id, :id, :close_to, :position, :mobile_position

  def panel_class
    "#{content_position} #{@panel_class}"
  end

  def content_position
    [position_class, mobile_position_class].join(' ')
  end

  def position_class
    'sm:items-center sm:p-0'
  end

  def mobile_position_class
    'p-4 items-end'
  end
end
