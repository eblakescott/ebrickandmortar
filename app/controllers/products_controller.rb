class ProductsController < ApplicationController

# Use a before_filter to find the current quote; actual method is private,
  # and defined at the bottom of this file. The current quote is always found
  # before any of the actions on the controller run.
  #
  # See http://guides.rubyonrails.org/action_controller_overview.html#filters

  before_filter :find_current_store

  # GET quotes/:quote_id/comments
  # GET quotes/:quote_id/comments.json
  def index

    # Set up a new instance of @comment so that a form appears
    # at the bottom of the comment listing for someone to write
    # a new Comment on the current quote:

    @product = Product.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # POST quotes/:quote_id/comments
  # POST quotes/:quote_id/comments.json
  def create

    @product = @store.products.build(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to store_products_path(@store), notice: 'Product was successfully created.' }
        #format.json { render json: @product, status: :created, store: @product }
      else
        #format.html { render action: "new" }
        #format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE quotes/:quote_id/comments/1
  # DELETE quotes/:quote_id/comments/1.json
  def destroy

    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to store_products_path(@product) }
      format.json { head :no_content }
    end
  end

  private

  def find_current_store
    @store = Store.find(params[:store_id]) # Grab the Quote based on the URL
  end

end
