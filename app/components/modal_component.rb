# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :footer

  def initialize(has_close_button: true)
    @has_close_button = has_close_button
  end

  attr_reader :has_close_button
end
