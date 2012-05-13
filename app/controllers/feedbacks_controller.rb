class FeedbacksController < ApplicationController

  before_filter do
    @customer = Customer.find_by_app_key(params[:app_key])
  end

  def index
    @feedback = @customer.feedbacks unless @customer.nil?
    render json: @feedback
  end

  def create
    @feedback = @customer.feedbacks.create(params[:feedback])
    # @feedback.save
    render json: @feedback
  end

end