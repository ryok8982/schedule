Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get "tasks" => "tasks#index"
#  get "tasks/new" => "tasks#new"
   get "tasks/check/:id" => "tasks#check"
#   get "tasks/edit/:id" => "tasks#edit"
#   post "tasks/create" => "tasks#create"
#   patch "tasks/update" => "tasks#update"
#   delete "tasks/:id/destroy" => "tasks#destroy"
   resources :tasks
end
