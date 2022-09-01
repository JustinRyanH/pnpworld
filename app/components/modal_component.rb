# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :footer

  # @param [Boolean] has_close_button adds the close button to the header
  def initialize(has_close_button: true, label_id: nil, id: nil)
    @id = id
    @has_close_button = has_close_button
    @label_id = label_id
  end

  private

  attr_reader :has_close_button, :label_id, :id
end
