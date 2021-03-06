Rails.application.routes.draw do
  # use_doorkeeper

  namespace :api do
    namespace :v1 do
      resources :stores, only: [:index]
      resources :exemplars, only: [] do
        patch :update, on: :collection
      end
    end
  end
end
