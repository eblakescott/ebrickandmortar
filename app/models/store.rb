class Store < ActiveRecord::Base
has_many :products, dependent: :destroy
attr_accessible :title, :description, :image_url, :address

def self.search(search)
  if search
    where('title ILIKE ? OR description ILIKE ? OR address ILIKE ?', "%#{search}%", "%#{search}%")
  else
    all
  end
end
end
