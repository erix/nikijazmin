class Admin::ReviewsController < Admin::AdminController
  def index

  end

  def new
    @product = Product.find(params[:product_id])
  end

  def create
    product = Product.find(params[:product_id])
    @review = product.reviews.build(params[:review])
    if @review.save
      flash[:success] = "New product review created"
      redirect_to products_path
    else
      flash[:error] = "Failed to create new review"
      redirect_to :new
    end
  end
end
