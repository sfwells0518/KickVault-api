class ProductsController < ApplicationController
  def show_ipad
    @contact = product.find_by(id: 1)
    render template: "contacts/show"


end
