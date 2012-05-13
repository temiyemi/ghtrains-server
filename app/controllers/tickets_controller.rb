class TicketsController < ApplicationController

  before_filter do
    @customer = Customer.find_by_app_key(params[:app_key])
  end

  def index
    @tickets = @customer.tickets
    # render json: @tickets
    render js: "#{params[:callback]}(#{@tickets.to_json});"
  end

  def create
    @ticket = @customer.tickets.create(params[:ticket])
    # @ticket.save
    # render json: @ticket
    render js: "#{params[:callback]}(#{@ticket.to_json});"
  end

  def show
    # @ticket = Ticket.find_by_number(params[:number])
    @ticket = Ticket.find(params[:id])
    render js: "#{params[:callback]}(#{@ticket.to_json});"
  end

  def update
    # @ticket = Ticket.find_by_number(params[:number])
    @ticket = Ticket.find(params[:id])
    @ticket.update_attributes(status: "activated")
    # render json: @ticket
    render js: "#{params[:callback]}(#{@ticket.to_json});"
  end

  def destroy
    Ticket.find(params[:id]).destroy
    # render json: @ticket
    render js: "#{params[:callback]}(#{@customer.tickets.to_json});"
  end

end