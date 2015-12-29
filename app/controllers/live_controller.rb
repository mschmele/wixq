class LiveController < ApplicationController
	def index
		@requests = Request.all.where(acknowledged: false)
	end
end
