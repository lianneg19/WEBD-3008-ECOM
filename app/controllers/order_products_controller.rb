class OrderProductsController < ApplicationController
  # before_action :set_order_product, only: %i[ show edit update destroy ]

  # GET /order_products or /order_products.json
  def index
    @order_products = OrderProduct.all
    @order = initialize_order_cart
    @products = Product.all
    @categories = Category.all
  end

  # GET /order_products/1 or /order_products/1.json
  def show
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
    @order_product = OrderProduct.new(order_product_params)

    if @order_product.save
      redirect_to products_path, notice: "Product added to cart!"
    else
      redirect_to products_path, notice: "Failed to add product to cart."
    end
  end

  # # PATCH/PUT /order_products/1 or /order_products/1.json
  # def update
  #   respond_to do |format|
  #     if @order_product.update(order_product_params)
  #       format.html { redirect_to @order_product, notice: "Order product was successfully updated." }
  #       format.json { render :show, status: :ok, location: @order_product }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @order_product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /order_products/1 or /order_products/1.json
  def destroy
    @order_product.destroy!

    respond_to do |format|
      format.html { redirect_to order_products_path, status: :see_other, notice: "Order product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_product
      @order_product = OrderProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_product_params
      params.permit(:order_id, :product_id)
    end
end
