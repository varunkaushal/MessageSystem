MessageSystem::Application.routes.draw do
  root "pages#home"

  resources :users
  resources :sessions

  get "/logout" => "sessions#destroy", as: 'logout'

  post "/send" => "users#sendM"
  
  get "/inbox" => "pages#inbox"
  get "/outbox" => "pages#outbox"
  
  get "/view.:message_id" => "pages#view"
  get "/view" => "pages#view"
  
  get "/message" => "pages#message"
  
  patch "/update.:message_id" => "pages#update"
  
  delete "/inbox/:message_id" => "pages#remove"
end
