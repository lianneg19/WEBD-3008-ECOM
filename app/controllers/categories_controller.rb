class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
  end

  private
    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
