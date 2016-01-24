Rails.application.routes.draw do

root 'welcome#index'

 get "about" => 'welcome#about'
 get "contact" => 'welcome#contact'
 get "plans" => 'welcome#plans'
 get "admin" => 'welcome#admin'

resources :users, :reports
 get 'signup' => 'users#new'
 get "report/admin" => 'reports#admin'
 get "user/admin" => 'users#admin'

resource :session
 get "signin" => "sessions#new"

resources :organizations

end