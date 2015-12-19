class Admin::ShowsController < ApplicationController
	layout 'admin'
	before_action :find_show, only: [:edit, :update, :destroy]

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
	end

	def show
		@shows = Show.all
	end

	def update
		if @show.update_attributes(show_params)
			flash[:success] = "Successfully updated show \"" + show.name + "\"!"
			redirect_to admin_shows_path
		else
			flash[:error] = "Error updating show!"
			render 'update'
		end
	end

	def destroy
		if @show.destroy
			flash[:success] = "Show \"" + show.name + "\" successfully deleted."
			redirect_to admin_shows_path
		else
			flash[:error] = "Error deleting show!"
			render 'show'
		end
	end

	private

	def show_params
		params.require(:show).permit(:id, :name, :start_time, :end_time, :day_of_week)
	end

	def find_show
		@show = Show.find(params[:id])
	end

end
