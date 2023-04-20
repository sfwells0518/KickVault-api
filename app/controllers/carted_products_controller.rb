class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = current_user.carted_products
    render :index
  end

  def create
    @carted_product = Carted_Product.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status],
      order_id: params[:order_id],
    )
    @carted_product.save
    render json: { message: "Product successfully added to cart!" }
  end
end
