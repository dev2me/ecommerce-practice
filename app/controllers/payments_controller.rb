class PaymentsController < ApplicationController
	include PayPal::SDK::REST
  def create
  	payment = Payment.new({
      :intent => "sale",
      :payer => {
        :payment_method => "paypal"
      },
      :transactions => [{
        :item_list => {
          :items => [{:name => "Demo", :sku => "item", :price => (@shopping_cart.total / 100), :currency => "USD", :quantity => 1}],
        },
        :amount => {
          :total => (@shopping_cart.total / 100),
          :currency => "USD"
        },
        :description => "This is the payment transaction description"
      }],

      :redirect_urls => {
        :return_url => "http://localhost:3000",
        :cancel_url => "http://localhost:3000/carrito"
      }
    })  
  	if payment.create
  		redirect_to payment.links.find{|v| v.method == "REDIRECT"}.href
  	else
  		raise payment.error.to_yaml
  	end
  end
end
