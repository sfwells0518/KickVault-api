class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render :index
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil,
    )
    @carted_product.save
    render json: { message: "Product successfully added to cart!" }
    # render json: { message: "create action test" }
  end

  def destroy
    # find the correct carted_product
    @carted_product = CartedProduct.find_by(id: params[:id])
    # change the status
    # @carted_product.update(status: "removed")
    @carted_product.status = "removed"
    @carted_product.save
    render json: { message: "Product removed from cart" }
  end
end
