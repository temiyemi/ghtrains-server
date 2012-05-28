class AccountsController < ApplicationController

  def index
    @customer = Customer.find_or_create_by_app_key(params[:user][:app_key])
    user = params[:user].dup
    user.delete(:app_key)
    @customer.update_attributes(user)
    render js: "#{params[:callback]}(#{@customer.to_json});"
  end

end