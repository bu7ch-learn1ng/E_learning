Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }  

resources :schools do
	
end
  #Users
  get  "/my_current_user" => "users#my_current_user"
  match 'users/:id' => 'users#update_user', via: [:patch]
  get '/send_password' => "users#reset_password"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
