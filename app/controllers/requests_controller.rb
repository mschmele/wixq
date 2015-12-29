class RequestsController < ApplicationController
  def make_request
    @request = Request.new(request_params)
    if @request.save
      respond_to do |format|
        format.json { render json: {:request => @request}}
      end
    else
      flash[:error] = "Error sending request!"
    end
  end

  private

  def request_params
    params.require(:request).permit(:title, :artist, :requested_by)
  end
end
