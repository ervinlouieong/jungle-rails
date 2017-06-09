class UserMailer < ApplicationMailer
 
  def notify_user(order)
    @order = order
    @url  = 'http://example.com/login'
    mail(to: @order.email, subject: "Jungle order #: #{order.id}")
  end
end
