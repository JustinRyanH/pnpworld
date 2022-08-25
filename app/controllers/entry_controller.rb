class EntryController < ApplicationController
  before_action :authenticate_user!
  def index
    @foo = ""
  end
end
