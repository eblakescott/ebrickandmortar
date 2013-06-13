class ShopController < ApplicationController
  def index
  @stores = Store.order(:title)
  end
end
