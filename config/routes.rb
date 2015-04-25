Rails.application.routes.draw do

  devise_for :users, skip: :sessions

  resources :scopes, except: [:new, :edit]

  resources :event_types, except: [:new, :edit]
  resources :events, except: [:new, :edit]

  resource :state_types, except: [:new, :edit]
  resource :states, except: [:new, :edit]

end
