class Admin::OrderTwosController < ApplicationController
  before_action :authenticate_user!
  layout "admin"

  def index
    @order_twos = OrderTwo.all
  end

  def destroy
    @order_two = OrderTwo.find(params[:id])
    @order_two.destroy
    redirect_to admin_order_twos_path
  end

  def confirm_cancel
		@order = OrderTwo.find(params[:id])
		if @order.aasm_state === "order_matched"
				@order.cancel_order!
				OrderMailer.notify_order_cancelled(@order).deliver!
				flash[:warning] = "Order cancelled. User will be notified via email."
		else
			flash[:alert] = "Order cannot be cancelled. Check order status is 'order_matched'."
		end

		redirect_to :back
	end

	def admin_revive
		@order = OrderTwo.find(params[:id])
		if @order.aasm_state === "order_cancelled" || @order.aasm_state === "order_met"
			@order.revive_order!
			OrderMailer.notify_order_revived(@order).deliver!
			flash[:notice] = "Order revived. User will be notified via email."
		else
			flash[:warning] = 'Order cannot be revived. Check order status is "order_cancelled" or "order_met".'
		end
		redirect_to :back
	end
end