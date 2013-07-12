Earthquaker::Application.routes.draw do
  resources :earthquakes, only: :index
end
