Rails.application.routes.draw do
  get 'registrations/create'
  devise_for :users, controllers: { sessions: "sessions", registrations: "registrations" }

  root to: 'rooms#show'

  mount ActionCable.server => '/cable'
end
