Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  resources :users, only: [ :show, :edit, :update ] do
    resources :education_records, shallow: true
    resources :employment_records, shallow: true
    resources :documents, shallow: true, only: [ :index, :new, :create, :show, :destroy ]
  end

  resources :maintenance_records, only: [] do
    resources :documents, shallow: true, only: [ :index, :new, :create, :show, :destroy ]
  end

  resources :families do
    member do
      patch :switch
    end

    collection do
      get :join
      post :join
    end

    resources :family_users, only: [ :index, :create, :update, :destroy ]
    resources :accounts
    resource :calendar, only: [ :show ]
    resources :events do
      collection do
        get :index
      end
    end
    resources :properties do
      resources :maintenance_records, shallow: true
      resources :documents, shallow: true, only: [ :index, :new, :create, :show, :destroy ]
    end
  end

  # Defines the root path route ("/")
  root "home#index"
end
