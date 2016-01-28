Rails.application.routes.draw do
  root 'welcome#index'

  # Public facing/content routes
  resources :djs
  get 'shows' => 'shows#index'
  post 'request' => 'requests#make_request'
  get 'now-playing' => 'songs#now_playing'

  # Admin/CMS routes
  namespace :admin do
    resources :djs
    resources :requests
    resources :shows
    resources :songs
  end
  get 'admin' => 'admin/admin#index'
  get 'live' => 'live#index'
  post 'request/acknowledge' => 'requests#acknowledge'
  post 'song' => 'songs#log'
  get 'login' => 'djs#login'
  post 'login' => 'djs#handle_login'
  get 'logout' => 'djs#logout'
end
