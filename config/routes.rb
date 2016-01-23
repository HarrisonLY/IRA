Rails.application.routes.draw do

root 'welcome#index'

resources :reports, path: '/report'

end
