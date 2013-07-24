class Store < ActiveRecord::Base
has_many :products, dependent: :destroy
has_many :shoes, dependent: :destroy
attr_accessible :title, :description, :image_url, :address

def self.search(search)
  if search
    where('title ILIKE ? OR description ILIKE ? OR address ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  else
    scoped
  end
end

end
