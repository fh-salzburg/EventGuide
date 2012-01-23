EventGuide::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "visitors/givestar/:id" => "visitors#give_star", :as => "give_star"
  get "visitors/addtogroup/:id" => "visitors#add_to_group", :as => "add_to_group"
  delete "visitors/deletefromgroup/:id" => "visitors#delete_from_group", :as => "delete_from_group"
  post "visitors/search" => "visitors#search", :as =>"search_visitor"

  resources :visitors, :users, :events, :sessions

  #match urls
  match 'index', :to => 'application#index'
  match 'ranking', :to => 'visitors#ranking'
  match 'timedevents', :to => 'application#timed_events'
  match 'stations', :to => 'application#stations'
  match 'login', :to => 'users#login'

  root :to => "application#index"

end
