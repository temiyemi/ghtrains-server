Ghtrains::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :staffs

  scope '/api' do

    match "accounts",                  to: "accounts#index"

    match "data",                      to: "routes#index"

    match "feedbacks/delete/:id",    to: "feedbacks#destroy"
    match "feedbacks/new",        to: "feedbacks#create"
    match "feedbacks/:app_key",        to: "feedbacks#index"

    match "tickets/delete/:id",      to: "tickets#destroy"
    match "tickets/edit/:id",      to: "tickets#update"
    match "tickets/new",          to: "tickets#create"
    match "tickets/:app_key",          to: "tickets#index"
	
	match "/", to: "index#index"

  end

  root to: 'index#index'

end
