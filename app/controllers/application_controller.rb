# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_live_reload
  before_action :use_navigation

  NavigationBtn = Struct.new(:link, :text, :controller, keyword_init: true)

  private

  helper_method :navigation_buttons

  # @return [Array<NavigationBtn>]
  def navigation_buttons
    @navigation_buttons = [
      NavigationBtn.new(link: root_path, text: 'Home'),
      login_logout_btn
    ]
  end

  def login_logout_btn
    return NavigationBtn.new(link: destroy_user_session_path, text: 'Logout') if @current_user.present?
    NavigationBtn.new(link: new_user_session_path, text: 'Login')
  end

  def set_live_reload
    @live_reload = true
  end

  def use_navigation
    @use_navigation = true
  end
end
