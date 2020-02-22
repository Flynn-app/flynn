Rails.application.routes.draw do
  resources :audios, only: [:new, :create, :show, :index]
  # scope "/home" do
  #   resources :users
  # end

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [ :show, :edit ], param: :nickname do
    member do
      get :follow
      get :unfollow
    end

    resources :playlists
  end


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :audios, only: [ :create, :index, :show, :index ]
      resources :audios_playlists, only: [ :create, :destroy ]
    end
  end
end
