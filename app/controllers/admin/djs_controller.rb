class Admin::DjsController < ApplicationController
	layout 'admin'
	before_action :find_dj, only: [:edit, :update, :destroy]
	def create
		@dj = Dj.new(dj_params)
		if @dj.save
			flash[:success] = "DJ \"" + @dj.first_name + " " + @dj.last_name + "\" Created"
			redirect_to admin_djs_path
		else
			flash[:error] = "Error updating show!"
			render 'new'
		end
	end

	def new
		@dj = Dj.new
		@shows = Show.all
	end

	def edit
		@shows = Show.all
	end

	def show
		@djs = Dj.all
	end

	def update
		if @dj.update_attributes(dj_params)
			flash[:success] = "Successfully updated DJ \"" + @dj.first_name + " " + @dj.last_name + "\"!"
			redirect_to admin_djs_path
		else
			flash[:error] = "Error updating DJ!"
			render 'update'
		end
	end

	def destroy
		if @dj.destroy
			flash[:success] = "DJ \"" + @dj.first_name + " " + @dj.last_name + "\" Deleted!"
			redirect_to admin_djs_path
		else
			flash[:error] = "Error deleting DJ!"
			render 'show'
		end
	end

	private

	def dj_params
		params.require(:dj).permit(:id, :first_name, :last_name, :show_id)
	end

	def find_dj
		@dj = Dj.find(params[:id])
	end
end
