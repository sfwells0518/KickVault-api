class ProductsController < ApplicationController
  def show_ipad
    # @product = Product.find_by(id: 1)
    # render template: "products/show"

    render json: { message: "hello" }
  end

  def show_macbook
    @product = Product.find_by(id: 2)
    render template: "products/show"
    # render json: { message: "hello" }
  end

  def show_iphone_14_pro
    @product = Product.find_by(id: 3)
    render template: "products/show"
    # render json: { message: "hello" }
  end

  def show_products_all
    @products = Product.all
    render template: "products/index"
    # render json: { message: "hello" }
  end
end
