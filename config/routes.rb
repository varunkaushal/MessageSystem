MessageSystem::Application.routes.draw do
  root "pages#home"

  resources :users
  resources :sessions

  get "/logout" => "sessions#destroy", as: 'logout'

  get "/inbox" => "pages#inbox"
  get "/outbox" => "pages#outbox"
end
