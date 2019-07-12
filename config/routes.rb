Rails.application.routes.draw do
  root 'sessions#new'

  match "events/attend" => "event_attendance#attend", :via => :post, :as => :attend_event
  match "users/logout" => "sessions#destroy", :via => :get, :as => :users_logout
  resources :events, only:[:new, :create, :index, :show]
  resources :sessions, only:[:new, :create]
  resources :users, only:[:new, :create, :index, :show]
end
