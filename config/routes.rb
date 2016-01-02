Rails.application.routes.draw do
  root 'welcome#index'

  # Public facing/content routes
  get 'djs' => 'djs#index'
  get 'shows' => 'shows#index'
  post 'request' => 'requests#make_request'
  get 'now-playing' => 'songs#now_playing'

  # Admin/CMS routes
  namespace :admin do
    resource :djs
    resource :requests
    resource :shows
    resource :songs
  end
  get 'admin' => 'admin/admin#index'
  get 'live' => 'live#index'
  post 'request/acknowledge' => 'requests#acknowledge'
  post 'song' => 'songs#log'
end
