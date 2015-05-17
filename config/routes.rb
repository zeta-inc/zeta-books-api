Rails.application.routes.draw do
  resources :documents do
    resources :parts, only: [:index]
  end

  resources :parts, only: [:show]
end
