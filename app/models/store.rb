class Store < ActiveRecord::Base
has_many :products, dependent: :destroy

def self.search(search)
  if search
    where('title ILIKE ? OR description ILIKE ? OR address ILIKE ?', "%#{search}%", "%#{search}%")
  else
    scoped
  end
end
end
