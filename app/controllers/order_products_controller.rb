class OrderProductsController < ApplicationController
  # before_action :set_order_product, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  include ApplicationHelper
  # GET /order_products or /order_products.json
  def index
    @order_products = OrderProduct.all
    @products = Product.all
    @categories = Category.all
  end

  # GET /order_products/1 or /order_products/1.json
  def show
    @order_product = OrderProduct.find(params[:id])
  end

  # GET /order_products/new
  def new
    @order_product = OrderProduct.new
  end

  # # GET /order_products/1/edit
  # def edit
  # end

  # POST /order_products or /order_products.json
  def create
    Rails.logger.debug("#{params.inspect}")
    @order = current_order
    @order_product = @order.order_products.new(order_product_params)
    if @order.save
      flash[:notice] = "Added to cart!"
    else
      flash[:notice] = "Failed to add!"
    end
    session[:order_id] = @order.id
    redirect_to request.referer || products_path
  end

  def update
    @order = current_order
    @order_product = @order.order_products.find(params[:id])
    @order_product.update(order_product_params)
    @order_products = @order.order_products
    redirect_to carts_path
  end

  # DELETE /order_products/1 or /order_products/1.json
  def destroy
    @order = current_order
    @order_product = @order.order_products.find(params[:id])
    if @order_product
      @order_product.destroy
      flash[:notice] = "Product Deleted!"
    else
      flash[:notice] = "Failed to Delete!"
    end
    redirect_to carts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_product
      @order_product = OrderProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_product_params
      params.require(:order_product).permit(:order_id, :product_id, :quantity,
        :unit_price, :total_price)
    end
end
