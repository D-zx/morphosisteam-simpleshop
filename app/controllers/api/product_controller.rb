class Api::ProductController < ApiController
    before_action :set_product, only: [:show, :update, :destroy]
    load_and_authorize_resource 
    
    def index
      @products = Product.all
      render json: @products
    end

    def create
      @product = Product.new(create_params)
      if @product.save
        render json: @product
      else
        render json: { errors: @product.errors }
      end
    end

    def show
      render json: @product
    end

    def update
      if @product.update_attributes(update_params)
        render json: @product
      else
        render json: { errors: @product.errors }
      end
    end

    def destroy
      if @product.destroy
        render json: "Product have been successfully deleted"
      else
        render json: { errors: @product.errors }
      end
    end
    
    private
    def set_product
      @product = Product.find(params[:id])
    end

    def create_params
      params.permit(:title, :description, :image, :price, :sku, :stock, :region_id)
    end

    def update_params
      params.permit(:title, :description, :image, :price, :sku, :stock, :region_id)
    end

end
