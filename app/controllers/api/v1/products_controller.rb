class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products, status: 200
  end
  
  def show
    product = Product.find_by(id: params[:id])
    if product  
      render json: product, status: 200
    else
      render json: {error: 'Not foundddddddddddd!'}
    end 
  end

  def new
  end

  def create 
    product = Product.new(
      name: product_params[:name],
      brand: product_params[:brand],
      price: product_params[:price]
    )

    if product.save 
      render json: product, status: 200
    else 
      render json: {error: 'product not create'}
    end
  end

  def edit
  end

  private 
  def product_params
    params.require(:product).permit([:name, :brnad, :price])
  end
end
