class Admin::AdminController < ApplicationController
	layout 'admin'
	def index
		render 'admin/index'
	end
end
