class OrderMailerPreview < ActionMailer::Preview
  def order_email
    OrderMailer.order_email(User.first, Order.last)
  end
end
