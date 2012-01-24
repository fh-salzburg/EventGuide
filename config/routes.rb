EventGuide::Application.routes.draw do

  root :to => "application#index"

  #get "visitors/givestar/:id" => "visitors#give_star", :as => "give_star"
  #get "visitors/addtogroup/:id" => "visitors#add_to_group", :as => "add_to_group"
  #delete "visitors/deletefromgroup/:id" => "visitors#delete_from_group", :as => "delete_from_group"

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
  
  #match urls
  match 'index', :to => 'application#index'

  match 'timedevents', :to => 'application#timed_events'
  match 'stations', :to => 'application#stations'

end
