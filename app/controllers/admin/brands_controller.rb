class Admin::BrandsController < Admin::AdminController

  def index
    @brands = Brand.order(:name)
  end
  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new params[:brand]

    if @brand.save
      redirect_to admin_brands_path
    else
      render :new
    end
  end

  def edit
    @brand = Brand.find params[:id]
  end

  def update
    @brand = Brand.find params[:id]

    if @brand.update_attributes params[:brand]
      redirect_to admin_brands_path
    else
      render 'admin/brands/edit'
    end
  end

  def destroy
  end

end