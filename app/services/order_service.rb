class OrderService
    class << self
        def destroyOrder(order)
            @destroy_order = OrderRepository.destroyOrder(order)
        end
    end
end