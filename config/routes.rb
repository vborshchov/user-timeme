Rails.application.routes.draw do
  post 'statistics/create'

  get 'registrations/create'
  devise_for :users, controllers: { sessions: "sessions", registrations: "registrations" }

  root to: 'rooms#show'

  get '/rooms' => 'rooms#show'

  mount ActionCable.server => '/cable'
end
