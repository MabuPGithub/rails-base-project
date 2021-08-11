Rails.application.routes.draw do

  devise_for :admins, :controllers => { registrations: 'admins/registrations', sessions: "admins/sessions"}
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }
  
  get '/get/stock-view' => 'stocks_view#index', as: 'stock_view_index'
  get '/get/stock-view/:stocksymbol' => 'stocks_view#show', as: 'stock_view_show' 
  post '/post/buy-stocks' => 'my_stock#buy_stocks', as: 'post_req_buy_stocks'

  get '/get/mystocks' => 'stocks_view#view_my_stocks', as: 'stock_view_my_stocks'
  get '/get/transactions' => 'stocks_view#view_transactions', as: 'stock_view_transactions'
  delete '/get/mystocks/sell/:id' => 'my_stock#sell_stocks', as: 'delete_req_sell_stocks'
  get 'admins/pending_show' => 'admins#pending_show', as: 'admin_pending_show'
  post 'admins/pending_approve' => 'admins#pending_approve', as: 'admin_pending_approve'
  post 'admins/create_new_user' => 'admins#create', as: 'admin_create_new_user'
  # get 'admins/all_transactions' => 'admins#all_transactions', as: 'admin_all_transactions'
  get "/users", to: "stocks_view#index", :as => :user_root
  get "/admins", to: "admins#index", :as => :admin_root

  resources :users
  resources :admins

end
