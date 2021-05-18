class Api::RegionController < ApiController
    before_action :set_region, only: [:show, :update, :destroy]
    load_and_authorize_resource 
    
    def index
      @regions = Region.all
      render json: @regions
    end

    def create
      @region = Region.new(create_params)
      if @region.save
        render json: @region
      else
        render json: { errors: @region.errors }
      end
    end

    def show
      render json: @region
    end

    def update
      if @region.update_attributes(update_params)
        render json: @region
      else
        render json: { errors: @region.errors }
      end
    end

    def destroy
      if @region.destroy
        render json: {msg: "Region have been successfully deleted"}
      else
        render json: { errors: @region.errors }
      end
    end
    
    private
    def set_region
      @region = Region.find(params[:id])
    end

    def create_params
      params.permit(:title, :country, :currency, :tax)
    end

    def update_params
      params.permit(:title, :country, :currency, :tax)
    end

end
