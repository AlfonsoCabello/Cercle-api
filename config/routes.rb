Rails.application.routes.draw do
  resources :teams
  resources :roles
  resources :bussinesses do
    collection {
      post :import
      get :export
      get :dashboard 
    }
  end

  devise_for :users, :controllers => {:sessions => 'devise/sessions'}, :skip => [:registrations]
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "bussinesses#index"

end
