class ProductsController < ApplicationController
  def show_ipad
    # @products = product.find_by(id: 1)
    # render template: "products/show"
    render json: { message: "hello" }
  end

  def show_macbook
    # @products = product.find_by(id: 2)
    # render template: "products/show"
    render json: { message: "hello" }
  end

  def show_iphone_14_pro
    # @products = product.find_by(id: 3)
    # render template: "products/show"
    render json: { message: "hello" }
  end
end
