# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  renders_one :header
  renders_many :links

  def initialize(sticky: false)
    @sticky = sticky
  end

  private

  def classnames
    return "nav nav-sticky" if @sticky
    "nav"
  end
end
