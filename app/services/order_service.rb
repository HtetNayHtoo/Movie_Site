class OrderService
  class << self

    def index
      OrderRepository.index
    end

    def new
      OrderRepository.new
    end

    def create_order(order)
      OrderRepository.create_order(order)
    end

    def create(order)
      isSave = OrderRepository.create(order)
    end

    def update(id,order_form)
      @order = OrderRepository.find_by_id(id)
      isUpdate = OrderRepository.update(@order,order_form)
    end

    def destroyOrder(id)
      @order = OrderRepository.find_by_id(id)
      OrderRepository.destroyOrder(@order)
    end

    def set_order(id)
      @order = OrderRepository.find_by_id(id)
    end

  end
end