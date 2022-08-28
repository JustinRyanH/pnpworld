# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_live_reload

  NavigationBtn = Struct.new(:active, :link, :text, keyword_init: true)

  private

  helper_method :navigation_buttons

  # @return [Array<NavigationBtn>]
  def navigation_buttons
    [
      NavigationBtn.new(active: true, link: root_path, text: 'Home'),
      login_logout_btn
    ]
  end

  def login_logout_btn
    NavigationBtn.new(active: false, link: new_user_session_path, text: 'Login')
  end

  def set_live_reload
    @live_reload = true
  end
end
