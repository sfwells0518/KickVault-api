class ProductsController < ApplicationController
  def index
    @products = Product.all
    # render :index
    if current_user
      render :index
    else
      render json: { message: "You are not logged in!" }, status: :unauthorized
    end
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
      supplier_id: params[:supplier_id],
      user_id: current_user.id,
    )
    if @product.save
      @image = Image.new(
        url: params[:image_url],
        product_id: @product_id,
      )
      @image.save
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
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
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
