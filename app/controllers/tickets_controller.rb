class TicketsController < ApplicationController

  before_filter do
    @customer = Customer.find_by_app_key(params[:app_key])
  end

  before_filter :make_payment, only: :create

  def index
    get_all
  end

  def create
    @customer.tickets.create(params[:ticket])
    get_all
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update_attributes(status: params[:status])
    get_all
  end

  def destroy
    Ticket.find(params[:id]).destroy
    get_all
  end

  private
    def get_all
      @tickets = @customer.tickets.includes({schedule: :route})
      @tickets.each do |ticket|
        ticket['schedule'] = ticket.schedule
        ticket['route'] = ticket.schedule.route
        ticket['train'] = ticket.schedule.train
      end
      render js: "#{params[:callback]}(#{@tickets.to_json});"
    end

    def make_payment
      @status = PaymentService.new.process(params[:billing_account])
      unless @status.has_key?('success')
        render js: "#{params[:callback]}(#{@status.to_json});" and return
      end
    end

end
