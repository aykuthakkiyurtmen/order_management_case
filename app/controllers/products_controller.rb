class ProductsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = if current_user.admin?
                  current_user.products.all
                else
                  Product.all
                end
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    p "testtt"
    p @product
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :store_id)
  end
end
