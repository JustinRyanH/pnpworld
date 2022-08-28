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
      home_btn,
      login_logout_btn
    ]
  end

  def home_btn
    NavigationBtn.new(link: url_for(:root), text: I18n.t('navbar.root'))
  end

  def login_logout_btn
    controller = 'users/sessions'
    action = @current_user.present? ? 'destroy' : 'new'
    link = url_for(controller: controller.to_sym, action: action)
    text = I18n.t ['navbar', controller, action].join('.')
    NavigationBtn.new(link: link, text: text)
  end

  def set_live_reload
    @live_reload = true
  end

  def use_navigation
    @use_navigation = true
  end
end
