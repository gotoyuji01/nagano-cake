Rails.application.routes.draw do
  scope module: :public do
    #get 'addresses/index'
    #get 'addresses/edit'

  
    #get 'orders/new'
    #get 'orders/index'
    #get 'orders/show'
    #get 'orders/complete'
  
  
    #get 'cart_items/index'
  
  
    #get 'customers/show'
    #get 'customers/edit'
    #get 'customers/unsubscribe'

  
    #get 'items/index'
    #get 'items/show'
    resources :items,only:[:index,:show]
  
    root 'homes#top'
    get '/about' => 'homes#about', as: 'about'
  
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
