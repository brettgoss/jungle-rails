class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(order)
    @order = order
    @url  = 'localhost:3000'
    mail(to: order.email, subject: "Order confirmation for order ##{@order.id}")
  end
end
