Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }  

resources :courses do
 resources :chapters
end

resources :schools

	#Subscribtions
	post	 "/subscriptions" => "subscriptions#create"
	put		 "/subscriptions" => "subscriptions#update"
	delete "/subscriptions" => "subscriptions#delete"

	#Progresses
	get 		"chapters/read" 								=> "progresses#show"
	post 		"chapters/marks_as_complete" 		=> "progresses#create"
	delete 	"chapters/marks_as_incomplete" 	=> "progresses#delete"
	
  #Users
  get  	"/my_current_user" 	=> "users#my_current_user"
  get		"/subscribers"			=> "users#subsrcibers"
  get 	"/all_users"				=> "users#all_users"
  match "users/:id" 				=> "users#update_user", via: [:patch]
  get 	"/send_password" 		=> "users#reset_password"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
