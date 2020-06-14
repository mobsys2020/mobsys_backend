Rails.application.routes.draw do
  get 'sessions/new'
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'application#index'
  get '/register', to: 'users#new'
  get    '/login'   => 'sessions#new'
  post   '/login'   => 'sessions#create'
  get '/logout'  => 'sessions#destroy'
  get '/medplan'  => 'medplans#decide'
  get '/medplan/new'  => 'medplans#new'
  post '/medplan/new'  => 'medplans#create'
  get '/medplan/all' => 'medplans#all'
  post "/med/new" => 'meds#new'
  match "/medplan/del/:id" => "medplans#delete", via: :get
  match "/medplan/:id" => "medplans#show", via: :get
  match "/med/del/:id" => "meds#del", via: :get
  match "/request/:id" => "medplans#get", via: :get

end
