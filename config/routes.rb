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
  resources :users, only: [:show, :edit, :update]
  
  resources :workbooks
  resources :workbook_items do
    resources :choose_quizzes
    get 'choose_quizzes/:id/check' => 'choose_quizzes#check', as: 'choose_quizzes_check'
    resources :writing_quizzes
    resources :word_quizzes do
      member do
        resources :word_quiz_items
      end
    end
  end

  resources :memos
  
  get 'homes' => 'homes#top', as: 'top'
  
  root to: 'homes#top'
end
