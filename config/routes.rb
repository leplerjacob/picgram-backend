Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :users,

  # To overwrite default rails controller sessions routing. 
  controllers: {
    registrations: :registrations,
    sessions: :sessions
  }

end
