Rails.application.routes.draw do
  root 'welcome#index'

  resource :dj
  resource :request
  resource :show
  resource :song

  namespace :admin do
    resource :djs
    resource :requests
    resource :shows
    resource :songs
  end

  get 'admin' => 'admin/admin#index'
end
