class OrderMailer < ApplicationMailer
    default from: "admin@simpleshop.com"

    def order_confirm_email(order)
        @user = order.user
        @order = order
        mail(to: @user.email, subject: 'Please Confirm your Order.')
    end
end
