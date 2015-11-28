class Admin::DjsController < ApplicationController
	def show
		@dj = Dj.first
	end

	def new
		@dj = Dj.new
	end
end
