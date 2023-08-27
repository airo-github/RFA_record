Rails.application.routes.draw do
  get 'static_pages/before_login'
  get 'static_pages/after_login'
  get 'line_login_api/login', to: 'line_login_api#login'
  get 'line_login_api/callback', to: 'line_login_api#callback'
end
