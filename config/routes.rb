Rails.application.routes.draw do

root 'welcome#index'

 get "about" => 'welcome#about'
 get "contact" => 'welcome#contact'
 get "plans" => 'welcome#plans'
 get "admin" => 'welcome#admin'

resources :users, :reports
 get 'signup' => 'users#new'

resource :session
 get "signin" => "sessions#new"

resources :organizations

end