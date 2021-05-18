class Api::OrderController < ApiController
    before_action :set_product, only: [:show, :update, :destroy]
    load_and_authorize_resource 
    
    def index
      @order = Order.where(user: current_user.id)
      render json: @order.as_json(:include =>{:product_orders=>{:only=>:quantity, :include=>:product}})
    end

    def create
      @order = Order.new(create_params)
      @order.user = current_user
      @order.product_orders.new(product_order_params)
      if @order.save
        OrderMailer.order_confirm_email(@order).deliver
        render json: @order.as_json(:include =>{:product_orders=>{:only=>:quantity, :include=>:product}})
      else
        render json: { errors: @order.errors }
      end
    end

    def show
      render json: @order.as_json(:include =>{:product_orders=>{:only=>:quantity, :include=>:product}})
    end

    private
    def set_product
      @order = Order.find(params[:id])
    end

    def create_params
        params.permit(:name, :address, :summary, :phone)
    end

    def update_params
      params.permit(:name, :address, :summary, :phone)
    end

    def product_order_params
        params.permit(:product_orders=> [:product_id, :quantity])[:product_orders]
    end

end
