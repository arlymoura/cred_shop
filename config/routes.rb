require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  resources :proponents do
    collection do
      get :calculate_inss
    end
  end

  resources :reports, only: :index

  root "proponents#index"
end
