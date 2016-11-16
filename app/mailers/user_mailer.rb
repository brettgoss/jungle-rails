require 'net/smtp'
class UserMailer < ApplicationMailer
  default from: 'no-reply@fast-citadel-60478.herokuapp.com'

  def email_receipt(order)
    @order = order
    @url  = 'https://fast-citadel-60478.herokuapp.com'
    begin
      mail(to: order.email, subject: "Order confirmation for order ##{@order.id}")
    rescue Net::SMTPFatalError
      puts "User email isn't verified by MailGun"
      redirect_to @order
    rescue
      puts "There was an error."
    end
  end
end
