Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { registrations: 'api/registrations', confirmations: 'api/confirmation' }

  namespace :api do
    namespace :admin do
      resources :users
    end
    post :auth, to: 'authentication#create'
    get  :auth, to: 'authentication#fetch'
    post :change_password, to: 'password#change_password'

    resources :region
    resources :product
    resources :order do
      get 'payment/:id', to: 'payment#show'
    end
  end

end
