Rails.application.routes.draw do

root 'welcome#index'

resources :reports

 get "about" => 'welcome#about'
 get "contact" => 'welcome#contact'
 get "plans" => 'welcome#plans'
 get "admin" => 'welcome#admin'
 
 resources :users, :except => [:new]
 get 'signup' => 'users#new'

 resource :session
 get "signin" => "sessions#new"

end
