class LiveController < ApplicationController
  before_action :require_current_user
	def index
    @shows = Show.all
    @requests = Request.all.where(acknowledged: false)
	end
end
