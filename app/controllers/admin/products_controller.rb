class Admin::ProductsController < Admin::AdminController
  before_filter :authorize

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(params[:product])
    if product.save
      flash[:success] = "Product successfully created"
      redirect_to products_path
    else
      flash[:error] = "Failed to create new product"
      render "new"
    end
  end

  def update
    product = Product.find(params[:id])
    if product
      product.update_attributes(params[:product])
      flash[:success] = "Product successfully updated"
    end
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end
end
