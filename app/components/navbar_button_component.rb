# frozen_string_literal: true

class NavbarButtonComponent < ViewComponent::Base

  def inactive_css
    "block py-2 pr-4 pl-3 text-white hover:bg-blue-700/20 rounded md:font-bold md:bg-transparent md:text-blue-500 md:p-0 hover:md:bg-transparent dark:text-white"
  end
end
