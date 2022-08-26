class ApplicationController < ActionController::Base
  before_action :set_live_reload

  private

  def set_live_reload
    @live_reload = true
  end
end
