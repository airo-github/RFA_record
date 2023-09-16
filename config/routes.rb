Rails.application.routes.draw do
  root 'static_pages#top'
  get '/after_login', to: 'static_pages#after_login'
  resource :user, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :activity_images, only: %i[index new create]
  resources :activity_records, only: %i[index edit update destroy]
end
