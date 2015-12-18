class Admin::ShowsController < ApplicationController
	layout 'admin'
	def create
		@show = Show.new(show_params)
		if @show.save
			flash[:success] = "Show \"" + @show.name + "\" created!"
			redirect_to admin_shows_path
		else
			flash[:error] = "Error creating show!"
			render 'new'
		end
	end

	def new
		@show = Show.new
	end

	def edit
		@show = Show.find(params[:id])
	end

	def show
		@shows = Show.all
	end

	def update
		@show = Show.find(params[:id])
		if @show.update_attributes(show_params)
			flash[:success] = "Successfully updated show \"" + show.name + "\"!"
			redirect_to admin_shows_path
		else
			flash[:error] = "Error updating show!"
			render 'update'
		end
	end

	def destroy
		@show = Show.find(params[:id])
		@show.destroy
		flash[:success] = "Show \"" + show.name + "\" successfully deleted."
		redirect_to admin_shows_path
	end

	private

	def show_params
		params.require(:show).permit(:id, :name, :start_time, :end_time, :day_of_week)
	end

end
