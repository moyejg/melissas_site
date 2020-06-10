Rails.application.routes.draw do
  devise_for :users
  resources :pieces

  root "site#gallery"

  get 'gallery' => 'site#gallery'
  get 'dashboard' => 'site#dashboard'
  get 'piece_modal' => 'pieces#piece_modal'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'site#gallery', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
  
  post '/webhook_events/:source', to: 'webhook_events#create'
  


  
  



  # devise_for :users, controllers: {
  #       sessions: 'users/sessions',
  #       registrations: 'users/registrations'
  # }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
