class Admin::ShowsController < ApplicationController
	def create
		@show = Show.new(show_params)
		if @show.save
			flash[:success] = "Show \"" + @show.name + "\" created!"
			redirect_to admin_shows_path
		else
			render 'new'
		end
	end

	def new
		@show = Show.new
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
		params.require(:show).permit(:name, :start_time, :end_time, :day_of_week)
	end

end
