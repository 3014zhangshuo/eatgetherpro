class Account::FeedbacksController < ApplicationController
	before_action :authenticate_user! , only: [:new, :create]
	# before_action :find_order

	def new
		@order = Order.find(params[:order_id])
		@feedback = @order.feedbacks.new
	end

	def create
		@order = Order.find(params[:order_id])
		@feedback = @order.feedbacks.build(feedback_params)
		@feedback.user = current_user
		@feedback.order = @order
		@feedback.save

		redirect_to account_orders_path, notice: "反馈已保存，感谢您的填写！"
	end

	def edit
		@order = Order.find(params[:id])
		@feedback = current_user.feedbacks.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		@feedback = current_user.feedbacks.last

		if @feedback.update(feedback_params)
			redirect_to account_orders_path, notice: "反馈已更新。"
		else
			render :root
		end
	end

	private

	def feedback_params
		params.require(:feedback).permit(:title, :description, :image)
	end

	# def find_order
	# 	@order = Order.find(params[:order_id])
	# end

	# def new
	# 	@order = Order.find(params[:order_id])
	# 	@feedback = Feedback.new
	# end

	# def create
	# 	@order = Order.find(params[:order_id])
	# 	@feedback = Feedback.new(feedback_params)
	# 	@feedback.user = current_user
	# 	@feedback.order = @order
	# 	@feedback.save
	#
	# 	redirect_to account_orders_path, notice: "反馈已保存，感谢您的填写！"
	# end

	# def edit
	# 	@feedback = Feedback.find(params[:id])
	# end

	# def update
	# 	@feedback = Feedback.find(params[:id])
	# 	if @feedback.update(feedback_params)
	# 		redirect_to account_orders_path, notice: "反馈已更新。"
	# 	else
	# 		render :root
	# 	end
	# end

end
