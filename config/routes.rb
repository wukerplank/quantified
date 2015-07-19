Rails.application.routes.draw do

  # Authentication ============================================================
  devise_for :users
  resources :access_tokens

  # Resources =================================================================

  resources :scopes, except: [:new, :edit]

  resources :event_types, except: [:new, :edit]
  resources :events, except: [:new, :edit]

  resource :state_types, except: [:new, :edit]
  resource :states, except: [:new, :edit]

end
