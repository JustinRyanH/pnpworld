# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :footer

  # @param [Boolean] has_close_button adds the close button to the header
  def initialize(has_close_button: true, label_id: nil, id: nil, panel_class: '')
    @id = id
    @has_close_button = has_close_button
    @label_id = label_id
    @panel_class = panel_class
  end

  private

  def panel_class
    "#{content_position} #{@panel_class}"
  end

  def content_position
    'p-4 items-end sm:items-center sm:p-0'
  end

  attr_reader :has_close_button, :label_id, :id
end
