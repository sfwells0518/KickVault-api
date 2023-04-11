class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
    )
    if @product.save
      render :show
    else
      render json: { errors: @product.errors.full_messages }
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    # save updated product

    if @product.save
      render :show
    else
      render json: { errors: @product.errors.full_messages }
    end
    # initial test code: render json: {message: "hello"}
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    # delete/destroy product
    @product.destroy
    render json: { message: "Product has been successfully removed" }
  end
end
