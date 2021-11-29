Rails.application.routes.draw do

  root 'static_pages#top'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
  resources :users, :only => [:show] do
    resources :plant_basic_data, :plant_management_slips, :material_stock_table
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
