Rails.application.routes.draw do
  # get 'plant_basic_data/index'
  root 'static_pages#top'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, :only => [:show] do
    resources :plant_basic_data, :only => [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
