class OrdersController < ApplicationController
  before_action: authenticate_user
  
  def index
    @orders = Order.all
    # render :index
    if current_user
      render :index
    else
      render json: { message: "You are not logged in!" }, status: :unauthorized
    end
  end

  def show
    @order = Order.find_by(id: params[:id], )
    render :show
  end

  def create
    # add subtotal, tax and total calculations

    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )

    if @order.save
      render json: { message: "Order created successfully!" }
    else
      render json: { errors: @order.errors.full_messages }
    end
  end
end
