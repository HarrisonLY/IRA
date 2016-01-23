Rails.application.routes.draw do

root 'welcome#index'

resources :reports, path: '/report'

 get "about" => 'welcome#about'
 get "contact" => 'welcome#contact'
 get "plans" => 'welcome#plans'



end
