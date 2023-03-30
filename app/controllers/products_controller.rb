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
    # make new product in the db
    @product = Product.new(name: "Apple Pencil", price: 75, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd
      9GcScglgtPfXO1pSHCjKHH5dKtBW0CzokHxbnG2Hz7Ms-DA&usqp=CAUec=48600112", description: "Apple Pencil expands the power of iPad and opens up new creative possibilities.")

    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    @product.save
    render :show
    # copy/paste that code from rails console here
    # then @product.save
    # finally, render :show
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.description = params[:description]
    # save updated product
    @product.save
    render :show
    # initial test code: render json: {message: "hello"}
  end

  def destroy
    @product = Product.find_by(id: params[:id])

    @product.save
    render :show
  end
end
