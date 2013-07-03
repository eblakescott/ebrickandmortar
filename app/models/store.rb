class Store < ActiveRecord::Base
has_many :products, dependent: :destroy
attr_accessible :title, :description, :image_url, :address

include Tire::Model::Search
include Tire::Model::Callbacks

def self.search(params)
  tire.search(load: true) do
    query { string params[:query] } if params[:query].present?
  end
end
end
