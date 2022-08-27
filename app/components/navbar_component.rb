# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  renders_one :header
  renders_many :links
end
