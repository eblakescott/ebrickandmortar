class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :shoe
  belongs_to :cart
  attr_accessible :shoe_id, :cart_id, :quantity
  
  def total_price
    shoe.price * quantity
  end
end
