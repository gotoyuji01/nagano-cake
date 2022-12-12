Rails.application.routes.draw do
  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    
    resources :items,only:[:index,:show]
    
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :cart_items,only:[:index,:create,:update,:destroy]
    
    
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :orders,only:[:new,:index,:create,:show]
    
    
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
  
  end
  
  namespace :admin do
    root 'homes#top'
    
    resources :items,only:[:new,:index,:show,:edit,:create,:update]
    
    resources :genres,only:[:index,:edit,:create,:update]
    
    resources :customers,only:[:index,:show,:edit,:update]
    
    resources :orders,only:[:show,:update]
  
    resources :order_details,only:[:update]
  
  end
  
  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }
  
  devise_for :customers,skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
