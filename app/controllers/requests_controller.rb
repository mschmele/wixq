class RequestsController < ApplicationController
  def make_request
    @request = Request.new(request_params)
    if @request.save
      respond_json_request
    else
      flash[:error] = "Error sending request!"
    end
  end

  def acknowledge
    @request = Request.find(params[:id])
    @request.acknowledged = true
    if @request.save
      respond_json_request
    else
      flash[:error] = "Error acknowledging request!"
    end
  end

  private

  def request_params
    params.require(:request).permit(:title, :artist, :requested_by)
  end

  def respond_json_request
    respond_to do |format|
      format.json { render json: { :request => @request } }
    end
  end
end
