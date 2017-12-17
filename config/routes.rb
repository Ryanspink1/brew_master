Rails.application.routes.draw do
  root to: 'home#show', as: 'home'

  namespace :admin do
    get 'dashboard', to: 'dashboard#show'
  end

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  resources :users,     only: [:new, :create]
  resources :events,    only: [:show, :index]
  resources :breweries, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      namespace :events do
        get "/new_events",           to: "new_events#index"
        get "/current_events",       to: "current_events#index"
        get "/today",                to: "day_events#index"
        get "/modified_date_events", to: "modified_date_events#index"
        get "/brewery_events",       to: "brewery_events#index"
      end
      resources :events,           only:  [:show]
      resources :user_events,      only:  [:index, :create]
      resources :breweries,        only:  [:index, :show]
      resource  :user_events,      only:  [:destroy]
      resources :favorites,        only:  [:index]
      resources :favorites_events, only: [:index]
    end
  end
end
