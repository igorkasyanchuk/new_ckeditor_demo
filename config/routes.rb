Rails.application.routes.draw do
  resources :posts do
    member do
      put :update_inline
      get :public_page
    end
    collection do
      post :upload
    end
  end
  root to: 'posts#index'
end
