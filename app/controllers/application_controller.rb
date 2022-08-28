# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_live_reload
  before_action :use_navigation

  NavigationBtn = Struct.new(:link, :text, :controller, :active, keyword_init: true)

  private

  helper_method :navigation_buttons

  # @return [Array<NavigationBtn>]
  def navigation_buttons
    @navigation_buttons = [].tap do |buttons|
      buttons << build_navigation_button(controller: 'root')
      buttons << build_navigation_button(controller: 'characters') if current_user.present?
      buttons << build_navigation_button(controller: 'users/sessions', action: 'destroy') if current_user.present?
      buttons << build_navigation_button(controller: 'users/sessions', action: 'new') if current_user.nil?
    end
  end

  def build_navigation_button(controller:, action: nil)
    if action.nil?
      text = I18n.t(['navbar', controller].join('.'))
      link = link_for_index(controller)
    else
      link = url_for(controller: controller.to_sym, action:, only_path: true)
      text = I18n.t ['navbar', controller, action].join('.')
      active = false
    end
    NavigationBtn.new(link:, text:, active:)
  end

  def link_for_index(controller)
    return root_path if controller === 'root'
    url_for(controller: controller.to_sym, action: :index, only_path: true)
  end

  def set_live_reload
    @live_reload = true
  end

  def use_navigation
    @use_navigation = true
  end
end
