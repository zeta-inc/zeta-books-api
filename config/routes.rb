Rails.application.routes.draw do
  resources :documents do
    resources :parts, only: [:index, :create]
  end

  resources :parts, only: [:show]
end
