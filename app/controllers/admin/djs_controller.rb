class Admin::DjsController < ApplicationController
	layout 'admin'
	def create
		@dj = Dj.new(dj_params)
		if @dj.save
			flash[:success] = "DJ \"" + @dj.first_name + " " + @dj.last_name + "\" Created"
			redirect_to admin_djs_path
		else
			render 'new'
		end
	end

	def new
		@dj = Dj.new
		@shows = Show.all
	end

	def edit
		@dj = Dj.find(params[:id])
	end

	def show
		@djs = Dj.all
	end

	def update
		@dj = Dj.find(params[:id])
		if @dj.update_attributes(dj_params)
			# It worked!
		else
			render 'update'
		end
	end

	def destroy
		@dj = Dj.find(params[:id])
		@dj.destroy
		flash[:success] = "DJ \"" + @dj.first_name + " " + @dj.last_name + "\" Deleted!"
		redirect_to admin_djs_path
	end

	private
	def dj_params
		params.require(:dj).permit(:first_name, :last_name, :show_id)
	end
end
