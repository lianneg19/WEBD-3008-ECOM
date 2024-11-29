class ProductsController < ApplicationController
  # GET /products or /products.json
  def index
    @products = Product.search(params[:search], params[:category_id]).page(params[:page]).per(20)
    @categories = Category.all
    @order_product = current_order.order_products.new
    @order = current_order
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
  end

    private
    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id)
    end
end
