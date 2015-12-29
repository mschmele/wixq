Rails.application.routes.draw do
  root 'welcome#index'

  get 'djs' => 'djs#index'
  get 'shows' => 'shows#index'

  post 'request' => 'requests#make_request'
  post 'song' => 'songs#log'

  namespace :admin do
    resource :djs
    resource :requests
    resource :shows
    resource :songs
  end

  get 'admin' => 'admin/admin#index'

  get 'live' => 'live#index'
end
