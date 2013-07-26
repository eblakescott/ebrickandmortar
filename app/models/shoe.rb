class Shoe < ActiveRecord::Base
  belongs_to :store
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  attr_accessible :title, :description, :image_url, :price, :store_id, :sex, :size, :width, :color  

def self.latest
    Shoe.order(:updated_at).last
  end

def self.search(search)
  if search
    where('title ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%")
  else
    scoped
  end
end

  private

    # ensure that there are no line items referencing this shoe
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

end
