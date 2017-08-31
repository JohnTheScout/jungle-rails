class OrderMailer < ApplicationMailer
  def order_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Your recent order ##{@order.id} from Jungle")
  end
end
