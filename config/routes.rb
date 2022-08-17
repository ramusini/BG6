# frozen_string_literal: true

Rails.application.routes.draw do
  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # 管理者
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :tags
    resources :users
    resources :searches do
      collection do
        get "search"
      end
    end
  end

  # ユーザー
  scope module: :public do
    resources :users
    resources :boardgames
    resources :records
    resources :players
    resources :searches do
      collection do
        get "search"
      end
    end
    resources :bucket_lists do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    root to: "homes#top"
  end

  # ゲスト
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
