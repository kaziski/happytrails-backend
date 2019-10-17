Rails.application.routes.draw do
  
  post '/api/v1/login', to: 'api/v1/sessions#create'
  post '/api/v1/signup', to: 'api/v1/users#create'
  post '/api/v1/newtrail', to: 'api/v1/trails#create'
  # this has to be nested in user?
  get "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user"
  delete "/api/v1/logout", to: "api/v1/sessions#destroy"

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
  
  namespace :api do
    namespace :v1 do 

      resources :users do
        resources :trails, only: [:index]
      end

      resources :trails do
        resources :reviews, only: [:index]
      end
      resources :reviews
        
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
end

