EventGuide::Application.routes.draw do

  root :to => "application#index"

  #match urls
  match 'index', :to => 'application#index'
  match 'timedevents', :to => 'application#timed_events'
  match 'stations', :to => 'application#stations'

  resources :users, :events

  resources :sessions do
    get :destroy
    get :new
  end

  match 'logout', :to => 'sessions#destroy'

  resources :visitors do
    get :give_star
    get :add_to_group
    get :ranking
    post :search
    delete :delete_from_group
  end

  post "visitors/search" => "visitors#search", :as =>"search_visitor"
  match 'ranking', :to => 'visitors#ranking'

end
