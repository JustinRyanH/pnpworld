# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(kind: :info)
    @kind = kind
  end

  private

  def kind
    return @kind.to_s if [:info, :danger, :warning, :success].include? @kind
    'info'
  end
end
