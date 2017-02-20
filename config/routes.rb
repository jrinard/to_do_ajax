Rails.application.routes.draw do
  resources :lists do  # sets up the 7 restful routs - create delete etc
    resources :tasks
  end
end
