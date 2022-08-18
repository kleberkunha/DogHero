Rails.application.routes.draw do
  resources :dogs
  devise_for :users, controllers: { confirmations: 'confirmations' }
  
  resources :users do
    member do
      get :events
      get :confirm_email
    end
  end
  
  resources :events

  resources :subscribers, only: [:create, :destroy]


  get 'users/:id/events' => 'users#events', :as => :user_events

  get 'user/:id/edit', to: 'user#edit', as: 'edit'

  get 'admin', to: 'users#admin', as: 'admin'

  get 'about', to: 'about#about'
  get 'service', to: 'service#service'
  get 'products', to: 'products#products'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'home#index'
end
