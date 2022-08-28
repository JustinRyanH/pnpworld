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
    NavigationBtn.new(link: url_for(:root), text: I18n.t('routes.root'))
  end

  def login_logout_btn
    destroy_link = url_for(controller: 'users/sessions', action: 'destroy')
    new_link = url_for(controller: 'users/sessions', action: 'new')
    return NavigationBtn.new(link: destroy_link, text: I18n.t('routes.user_session.destroy')) if @current_user.present?
    NavigationBtn.new(link: new_link, text: I18n.t('routes.user_session.new'))
  end

  def set_live_reload
    @live_reload = true
  end

  def use_navigation
    @use_navigation = true
  end
end
