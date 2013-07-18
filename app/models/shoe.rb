class Shoe < ActiveRecord::Base
  belongs_to :store
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  attr_accessible :title, :description, :image_url, :price, :store_id, :sex  
end
