class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_shoe(shoe_id)
    current_item = line_items.find_by(shoe_id: shoe_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(shoe_id: shoe_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

def paypal_url(return_url)
  values = {
    :business => 'eblakescott@gmail.com',
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => id
  }
  line_items.each_with_index do |item, index|
    values.merge!({
      "amount_#{index+1}" => item.total_price,
      "item_name_#{index+1}" => item.shoe.title,
      "item_number_#{index+1}" => item.id,
      "quantity_#{index+1}" => item.quantity,
      "item_color_#{index+1}" => item.shoe.color,
      "item_size_#{index+1}" => item.shoe.size,
      "item_width_#{index+1}" => item.shoe.width
    })
  end
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end



end
