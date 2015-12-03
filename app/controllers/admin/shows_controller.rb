class Admin::ShowsController < ApplicationController
	def create
	end

	def new
	end

	def edit
	end

	def show
		@shows = Show.all
	end

	def update
	end

	def destroy
	end

	private
	def show_params
	end

end
