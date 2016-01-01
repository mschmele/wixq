class LiveController < ApplicationController
	def index
    @shows = Show.all
    @requests = Request.all.where(acknowledged: false)
	end
end
