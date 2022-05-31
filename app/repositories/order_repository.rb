class OrderRepository
    class << self
        def destroyOrder(order)
            @destroy_order = order.destroy
        end
    end
end