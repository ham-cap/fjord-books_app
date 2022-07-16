Rails.application.routes.draw do
  resources :books

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, :only => [:index, :show]

  devise_scope :user do
    post '/users/sign_out' => 'devise/sessions#destroy'
  end

  ## 開発環境用letter_opener
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
