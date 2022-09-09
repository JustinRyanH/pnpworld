# frozen_string_literal: true

class ModalComponentPreview < ViewComponent::Preview
  def modal_with_body_footer_header; end

  def modal_with_body_header; end

  def modal_with_body; end

  def modal_with_body_header_no_close; end

  def modal_with_no_close_or_header; end

  # Position
  # --------
  # This allows controlling where the Modal appears on the screen  view
  # @param position select [top, middle, bottom]
  # @param mobile_position select [top, middle, bottom]
  def modal_with_position(position: 'top', mobile_position: 'top')
    render ModalComponent.new(position:, mobile_position:) do |modal|
      modal.with_header do
        'Modal Header'
      end
      modal.with_body do
        'Modal Body'
      end
    end
  end
end
