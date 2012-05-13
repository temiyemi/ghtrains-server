Ghtrains::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :staffs

  scope '/api' do

    match "accounts",                  to: "accounts#index"

    match "data",                      to: "routes#index"

    match "feedbacks/:app_key",        to: "feedbacks#create",   via: :post
    match "feedbacks/:app_key",        to: "feedbacks#index"
    match "feedbacks/:id",             to: "feedbacks#destroy",  via: :delete

    match "tickets/:app_key",          to: "tickets#create",   via: :post
    match "tickets/:app_key",          to: "tickets#index"
    match "tickets/:id",               to: "tickets#destroy",  via: :delete

  end

  root to: 'index#index'

end