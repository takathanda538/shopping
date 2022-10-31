Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :genres, only: [:index,:edit,:create,:update]
    resources :items
    resources :customers
  end

  scope module: :public do
    get 'customers/unsubscribe', as: "unsubscribe"
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:show, :index]
    delete 'cart_items/destroy_all', as: "destroy_all"
    resources :cart_items, only:[:index,:update,:destroy,:create]
    get 'orders/thanks', as: "thanks"
    post 'orders/confirm' => 'orders#confirm'
    resources :orders, only:[:index,:show,:new,:create]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    get 'about' => 'homes#about'
    root 'homes#top'
  end
end
