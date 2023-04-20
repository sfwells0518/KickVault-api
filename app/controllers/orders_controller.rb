class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render :index
  end

  def show
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    render :show
  end

  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      # subtotal: params[:subtotal],
      # tax: params[:tax],
      # total: params[:total],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )

    if @order.save
      carted_products.each do |carted_product|
        carted_product.update(status: "purchased", order_id: @order.id)
      end
      render json: { message: "Order placed successfully!" }
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
