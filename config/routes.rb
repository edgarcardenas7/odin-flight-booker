Rails.application.routes.draw do
  resources :flights do
    post 'select', on: :member
  end

  root 'flights#index'  
end
