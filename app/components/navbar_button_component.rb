# frozen_string_literal: true

class NavbarButtonComponent < ViewComponent::Base
  def initialize(active: false, href: "#")
    @active = active
    @href = href
  end

  private

  attr_reader :href

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
