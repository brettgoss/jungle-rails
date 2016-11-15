class UserMailer < ApplicationMailer
  default from: 'no-reply@fast-citadel-60478.herokuapp.com'

  def email_receipt(order)
    @order = order
    @url  = 'https://fast-citadel-60478.herokuapp.com'
    mail(to: order.email, subject: "Order confirmation for order ##{@order.id}")
  end
end
