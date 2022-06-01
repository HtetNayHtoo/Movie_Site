class OrderRepository
  class << self

    def index
      @orders = Order.all
    end

    def new
      Order.new
    end

    def create_order(order)
      @order = Order.new(order)
    end

    def create(order)
      isSave = order.save
    end

    def find_by_id(id)
      @order = Order.find(id)
    end

    def update(order,order_form)
      order.total_price = order_form["qty"].to_i * order.movie.price
      isUpdate = order.update(order_form)
    end
      
    def destroyOrder(order)
       order.destroy
    end

    private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:total_price, :qty, :deliver_date, :deliver_flg)
    end

  end
end