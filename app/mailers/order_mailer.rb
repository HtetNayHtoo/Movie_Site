class OrderMailer < ApplicationMailer
    def order_list(user,order)
        @orders = order
        mail(:to => user, :subject => "Order list")
    end
    def order_send(user,order)
        @orders = order
        mail(:to=>user, :subject=> "Your order was successfully.")
    end
    def order_delete(user,order)
        @orders = order
        mail(:to=>user , :subject=> "Order Deleted.")
    end
end