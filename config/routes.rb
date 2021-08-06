Rails.application.routes.draw do

  devise_for :admins, :controllers => { registrations: 'admins/registrations', sessions: "admins/sessions"}
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }
  
  get '/get/stock-view' => 'stocks_view#index', as: 'stock_view_index'
  get '/get/stock-view/:stocksymbol' => 'stocks_view#show', as: 'stock_view_show' 
  get 'admins/pending_show' => 'admins#pending_show', as: 'admin_pending_show'
  post 'admins/pending_approve' => 'admins#pending_approve', as: 'admin_pending_approve'
  get 'admins/create_new_user' => 'admins#create_new_user', as: 'admin_create_new_user'
  # get 'admins/all_transactions' => 'admins#all_transactions', as: 'admin_all_transactions'
  get "/users", to: "stocks_view#index", :as => :user_root
  get "/admins", to: "admins#index", :as => :admin_root

  resources :users
  resources :admins
end
