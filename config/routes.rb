Rails.application.routes.draw do
  resources :audios, only: [:new, :create, :show]
  devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :audios, only: [ :create ]
    end
  end
end
