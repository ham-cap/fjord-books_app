Rails.application.routes.draw do
  #get 'follows/create'
  #get 'follows/destroy'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    member do
      get :followings, :followers
    end
  end
  scope ':id' do
    resources :follows, only: %i(create destroy)
  end
end
