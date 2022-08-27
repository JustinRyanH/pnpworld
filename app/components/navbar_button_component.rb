# frozen_string_literal: true

class NavbarButtonComponent < ViewComponent::Base
  def initialize(active: false)
    @active = active
  end

  private

  def is_active?
    @active
  end

  def inactive_css
    'nav-btn md:nav-btn inactive-nav-btn'
  end

  def active_css
    'nav-btn md:nav-btn active-nav-btn'
  end
end
