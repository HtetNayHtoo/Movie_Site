class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  # GET /orders or /orders.json
  def index
   
    if current_user.user_type == "Admin"
       @orders = OrderService.index
    else
      @orders = current_user.orders
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = OrderService.new
  end

  # GET /orders/1/edit
  def edit
  end

  def confirm
    @order = OrderService.create_order(order_params)
    @order.user_id = current_user.id
    @order.movie_id = current_movie.id
    render :new if @order.invalid?
  end

  # POST /orders or /orders.json
  def create
    @order = OrderService.create_order(order_params)
    @order.user_id = current_user.id
    @order.movie_id = current_movie.id
    isSave = OrderService.create(@order)
    respond_to do |format|
      if isSave
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    isUpdate = OrderService.update(params[:id],order_params)
    respond_to do |format|
      if isUpdate
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy

    OrderService.destroyOrder(params[:id])
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = OrderService.set_order(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:total_price, :qty, :deliver_date, :deliver_flg)
    end
end
