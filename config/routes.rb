Rails.application.routes.draw do
  # get 'dashboards/profile', to: "dashboards#profile"
  # get 'dashboards/:id/public/', to: "dashboards#public_profile", as: 'public'

  resources :audios, only: [:new, :create, :show]

  scope "/home" do
    resources :users

  devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :audios, only: [ :create, :index, :show ]
    end
  end
end
