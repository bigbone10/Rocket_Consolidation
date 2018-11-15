Rails.application.routes.draw do

  
  # resources :comments
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/residential' =>'home#residential'
  get '/commercial' =>'home#commercial'
  get '/intervention' => 'intervention#intervention_index'
  get '/quote' =>'quote#quote'
  get '/index-RocketElevators.html' =>'home#index'
  get '/index-rocketElevators-residential.html' => 'home#residential'
  get '/index-rocketElevators-commercial.html' => 'home#commercial'
  get '/index-Quote.html' => 'quote#quote'
  # get '/google_maps' => 'google_maps#maps'
  post '/new_quote' =>'quote#new_quote'
  post '/new_lead' =>'lead#new_lead'
  post '/new_intervention' => 'intervention#new_intervention'
  get '/chart' =>'charts#chart'
  get '/google' =>'google#google'

  # lists :
  get 'list_buildings_by_customers' => 'intervention#list_buildings_by_customers'
  get 'list_batteries_by_buildings' => 'intervention#list_batteries_by_buildings'
  get 'list_columns_by_batteries' => 'intervention#list_columns_by_batteries'
  get 'list_elevators_by_columns' => 'intervention#list_elevators_by_columns'

  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'home#index'

  

end
