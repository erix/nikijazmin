class Admin::ReviewsController < Admin::AdminController
  before_filter :fetch_product

  def index
    @reviews = @product.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = @product.reviews.build(params[:review])
    if @review.save
      flash[:success] = "New product review created"
      redirect_to product_reviews_path(@product)
    else
      flash[:error] = "Failed to create new review"
      redirect_to :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
      flash[:success] = "Product review updated"
      redirect_to product_reviews_path(@product)
    else
      flash[:error] = "Failed to update review"
      redirect_to :edit
    end
  end

  def destroy
    Review.destroy(params[:id])
    flash[:success] = "Review deleted"
    redirect_to product_reviews_path(@product)
  end

  private
  def fetch_product
    @product = Product.find(params[:product_id])
  end
end
