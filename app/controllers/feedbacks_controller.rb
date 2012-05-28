class FeedbacksController < ApplicationController

  before_filter do
    @customer = Customer.find_by_app_key(params[:app_key])
  end

  def index
    render js: "#{params[:callback]}(#{@customer.feedbacks.to_json});"
  end

  def create
    @customer.feedbacks.create(params[:feedback])
    render js: "#{params[:callback]}(#{@customer.feedbacks.to_json});"
  end

end
