Rails.application.routes.draw do

root 'welcome#index'

 get "about" => 'welcome#about'
 get "contact" => 'welcome#contact'
 get "plans" => 'welcome#plans'
 get "admin" => 'welcome#admin'

resources :organizations, :users, :reports
 get 'signup' => 'users#new'
 get "organization/admin" => 'organizations#admin'
 get "user/admin" => 'users#admin'
 get "report/admin" => 'reports#admin'
 
resource :session
 get "signin" => "sessions#new"

end