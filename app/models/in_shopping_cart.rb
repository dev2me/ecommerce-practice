class InShoppingCart < ActiveRecord::Base
  belongs_to :product
  belongs_to :shopping_cart
end
