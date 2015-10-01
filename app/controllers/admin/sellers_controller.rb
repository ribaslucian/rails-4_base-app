class Admin::SellersController < ApplicationController
  before_action :set_admin_seller, only: [:show, :edit, :update, :destroy]

  # GET /admin/sellers
  # GET /admin/sellers.json
  def index
    @admin_sellers = Admin::Seller.all
  end

  # GET /admin/sellers/1
  # GET /admin/sellers/1.json
  def show
  end

  # GET /admin/sellers/new
  def new
    @admin_seller = Admin::Seller.new
  end

  # GET /admin/sellers/1/edit
  def edit
  end

  # POST /admin/sellers
  # POST /admin/sellers.json
  def create
    @admin_seller = Admin::Seller.new(admin_seller_params)

    respond_to do |format|
      if @admin_seller.save
        format.html { redirect_to @admin_seller, notice: 'Seller was successfully created.' }
        format.json { render :show, status: :created, location: @admin_seller }
      else
        format.html { render :new }
        format.json { render json: @admin_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/sellers/1
  # PATCH/PUT /admin/sellers/1.json
  def update
    respond_to do |format|
      if @admin_seller.update(admin_seller_params)
        format.html { redirect_to @admin_seller, notice: 'Seller was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_seller }
      else
        format.html { render :edit }
        format.json { render json: @admin_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sellers/1
  # DELETE /admin/sellers/1.json
  def destroy
    @admin_seller.destroy
    respond_to do |format|
      format.html { redirect_to admin_sellers_url, notice: 'Seller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_seller
      @admin_seller = Admin::Seller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_seller_params
      params.require(:admin_seller).permit(:name, :corporate, :cnpj)
    end
end
