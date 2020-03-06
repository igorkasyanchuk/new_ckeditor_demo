Rails.application.routes.draw do

  mount FakeApi::Engine => '/api'

  get '/demo_api', to: 'posts#demo_api'

  resources :posts do
    member do
      put :update_inline
      get :public_page
    end
    collection do
      post :upload
      post :inline
      post :balloon
      post :classic
      post :classic_simple_form
    end
  end
  root to: 'posts#index'
end
