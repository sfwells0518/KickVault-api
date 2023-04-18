class OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )

    if @order.save
      render json: { message: "Order created successfully!" }
    else
      render json: { errors: @order.errors.full_messages }
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end

  def index
    @orders = Order.all
    # render :index
    if current_user
      render :index
    else
      render json: { message: "You are not logged in!" }, status: :unauthorized
    end
  end
end
