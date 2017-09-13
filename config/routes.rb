Rails.application.routes.draw do
  root to: 'home#show', as: 'home'

  namespace :api do
    namespace :v1 do
      namespace :events do
        get "/new_events", to: "new_events#new_events"
      end
    end
  end

end
