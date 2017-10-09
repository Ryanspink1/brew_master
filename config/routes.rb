Rails.application.routes.draw do
  root to: 'home#show', as: 'home'

  namespace :api do
    namespace :v1 do
      namespace :events do
        get "/new_events",           to: "new_events#index"
        get "/current_events",       to: "current_events#index"
        get "/today",                to: "day_events#index"
        get "/modified_date_events", to: "modified_date_events#index"
      end
    end
  end

  resources :events, only: [:show]

end
