Rails.application.routes.draw do
  devise_for :users

  resources :proponents do
    collection do
      get :calculate_inss
    end
  end

  root "proponents#index"
end
