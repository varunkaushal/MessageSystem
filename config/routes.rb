MessageSystem::Application.routes.draw do
  root "pages#home"

  resources :users
  resources :sessions

  get "/logout" => "sessions#destroy", as: 'logout'

  post "/send" => "users#sendM"
  
  delete "/inbox.:m_id" => "pages#removeM"
  get "/inbox" => "pages#inbox"
  get "/outbox" => "pages#outbox"
  
  get "/view.:message_id" => "pages#view"
  get "/view" => "pages#view"
  
  get "/message" => "pages#message"
  
  patch "/update.:message_id" => "pages#update"
end
