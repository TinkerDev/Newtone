Newtone::Application.routes.draw do
  root :to => "recognition#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get '/about' => 'home#about'

  scope :recognition do
    get '/file' => 'recognition#file', :as => :recognize_file
    get '/record' => 'recognition#record', :as => :recognize_record
    post '/recognize' => 'recognition#recognize', :as => :recognize
  end

end
