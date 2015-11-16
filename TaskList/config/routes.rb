Rails.application.routes.draw do
  root 'tasks#index'
  get 'tasks/' => 'tasks#index'
  get 'tasks/new' => 'tasks#new'
  get 'tasks/:id' => 'tasks#show'
  post 'tasks/' => 'tasks#create'
  delete 'tasks/:id' => 'tasks#destroy'
  get 'tasks/:id/edit' => 'tasks#edit'
  patch 'tasks/:id' => 'tasks#update'
  patch 'tasks/:id/completed' => 'tasks#toggle_completed'

  get 'people/' => 'people#index'
  get 'people/:id' => 'people#show'

  get 'people/:id/tasks' => 'people#show_tasks'

end
