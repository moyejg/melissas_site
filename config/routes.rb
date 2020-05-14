Rails.application.routes.draw do
  devise_for :users
  get 'site/gallery'
  resources :pieces

  root "site#gallery"

  # devise_for :users, controllers: {
  #       sessions: 'users/sessions',
  #       registrations: 'users/registrations'
  # }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
