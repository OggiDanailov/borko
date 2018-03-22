class SubscribersController < ApplicationController

	before_action :authenticate_user!

	def new
	end

	def create
		  # Amount in cents
		  @amount = 500

		  customer = Stripe::Customer.create(
		    :email => params[:stripeEmail],
		    :source  => params[:stripeToken]
		  )

		  subscriber = Stripe::Charge.create(
		    :customer    => customer.id,
		    :amount      => @amount,
		    :description => 'Rails Stripe customer',
		    :currency    => 'usd'
		  )
		  redirect_to root_path
	

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to root_path
	end
	# def update
	# 	token = params[:stripeToken]
	# 	customer = Stripe::Customer.create(
	# 		card: token,
	# 		product: prod_CXJBSUvTEP4cJS,
	# 		email: current_user.email,
	# 		plan: boris
	# 	)

		# current_user.subscribed = true
		# current_user.stripeid = customer.id
		# current_user.save
		# redirect_to root_path


end