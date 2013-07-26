class ShoesController < ApplicationController
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]
  before_filter :set_store
  
  # GET /shoes
  # GET /shoes.json
  def index
    @shoes = Shoe.all
    @shoes = @store.shoes.all
    @shoes = @store.shoes.search(params[:search])
  end

  # GET /shoes/1
  # GET /shoes/1.json
  def show
@shoe = @store.shoes.find(params[:id])
  end

  # GET /shoes/new
  def new
    @shoe = @store.shoes.build
  end

  # GET /shoes/1/edit
  def edit
@shoe = @store.shoes.find(params[:id])
  @shoe = @store.shoes.build(params[:shoe])  
end

  # POST /shoes
  # POST /shoes.json
  def create
    @shoe = @store.shoes.build(params[:shoe])

    respond_to do |format|
      if @shoe.save
        format.html { redirect_to [@store, @shoe], notice: 'Shoe was successfully added.' }
        #format.json { render json: @wait, status: :created, location: @wait }
      else
        #format.html { render action: "new" }
        #format.json { render json: @wait.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoes/1
  # PATCH/PUT /shoes/1.json
  def update
    respond_to do |format|
      if @shoe.update(shoe_params)
        format.html { redirect_to @shoe, notice: 'Shoe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoes/1
  # DELETE /shoes/1.json
  def destroy
    @shoe = @store.shoes.find(params[:id])
    @shoe.destroy
    respond_to do |format|
      format.html { redirect_to shoes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoe
      @shoe = Shoe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shoe_params
      params.require(:shoe).permit(:title, :description, :image_url, :price, :sex, :store_id, :size, :width, :color)
    end
def set_store
      @store = Store.find(params[:store_id])
    end
end
