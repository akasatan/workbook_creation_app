Rails.application.routes.draw do
  devise_for :admins, only: :sessions, controllers: {
    sessions: 'admins/sessions'
  }
  
  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
    resources :workbooks, only: [:index, :show, :edit, :update]
  end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  get '/users', to: redirect("/users/sign_up")
  resources :users, only: [:show, :edit, :update]

  get '/workbooks', to: redirect("/workbooks/new")
  get '/workbooks/:id/workbook_items', to: redirect("/workbooks")
  resources :workbooks, shallow: true do
    resources :workbook_items
  end
  
  resources :workbook_items, shallow: true do
    resources :choose_quizzes
    get 'choose_quizzes/:id/check' => 'choose_quizzes#check', as: 'choose_quizzes_check'
    resources :writing_quizzes
    get 'writing_quizzes/:id/check' => 'writing_quizzes#check', as: 'writing_quizzes_check'
    resources :word_quizzes do
      member do
        resources :word_quiz_items
      end
    end
    resources :memos
  end
  
  get 'homes' => 'homes#top', as: 'top'
  
  root to: 'homes#top'
end
