Rails.application.routes.draw do
  root 'static_pages#top'
  get '/before_login', to: 'static_pages#before_login'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  resource :user, only: %i[new create]
  resource :profile, only: %i[new show edit update]
  resource :reminder_time, only: %i[new create]
  resources :activity_images, only: %i[index new create]
  resources :activity_records, only: %i[index edit update destroy]
end
