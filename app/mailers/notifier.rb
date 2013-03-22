class Notifier < ActionMailer::Base
  default from: 'Suhas Gajakosh <from@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order

    mail to: order.email, subject: "SaaS Store Order Confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped
   @order = order

    mail to: "to@example.org", subject: "SaaS Store Order Shipped"
  end
end
