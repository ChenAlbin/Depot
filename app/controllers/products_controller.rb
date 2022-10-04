class ProductsController < ApplicationController

  before_action :find_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new    
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Create Success!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "Update Success!"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Delete Success!"
  end

  private

  def product_params
    params.require(:product).permit(:title,:description,:image_url,:price)    
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
