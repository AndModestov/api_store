Rails.application.routes.draw do
  # use_doorkeeper
  
  namespace :api do
    namespace :v1 do
      resources :stores, only: [:index]
      resources :books, only: [:index] do
        resources :exemplars, only: [:index], defaults: { product: 'books' }
      end
    end
  end
end
