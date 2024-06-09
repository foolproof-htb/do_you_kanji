Rails.application.routes.draw do
  devise_for :users
  root 'kanjis#index'

  get 'kanjis', to: 'kanjis#index'
  get 'kanjis/search', to: 'kanjis#search'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
