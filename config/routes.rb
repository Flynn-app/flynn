Rails.application.routes.draw do
  get 'profile/:id', to: "profile#profile", as: 'profile'
  # get 'dashboards/:id/public/', to: "dashboards#public_profile", as: 'public'

  resources :audios, only: [:new, :create, :show]

  scope "/" do
    resources :users
  end

  devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :audios, only: [ :create, :index, :show ]
    end
  end
end
