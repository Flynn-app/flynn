Rails.application.routes.draw do
  get 'users/show'
  resources :audios, only: [:new, :create, :show]
  scope "/home" do
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
