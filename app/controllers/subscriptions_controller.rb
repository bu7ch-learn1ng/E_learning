class SubscriptionsController < ApplicationController
	before_filter :authenticate_user!

	def create
		user = current_user
		token = params[:stripeToken]

		customer = Stripe::Customer.create(
			card: token,
			plan: 2,
			email: user.email
			)

		user.subscribed = "pro"
		user.stripeid = customer.id
		user.save

		render json: user
	end

	def delete
		user = current_user
		customer = Stripe::Customer.retrieve(user.stripeid)
		subscription_id = customer.scubscritions.first.id
		subscribtion = customer.subscribtion.retrieve(subscribtion_id).delete
		user.subscribed = "basic"
		user.save
		render json: user 
	end
end