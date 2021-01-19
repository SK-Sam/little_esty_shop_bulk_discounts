class DiscountsController < ApplicationController
  before_action :set_merchant

  def index
  end

  def new
    @discount = Discount.new
  end

  def create
    @discount = @merchant.discounts.new(discount_params)
    if @discount.valid?
      @discount.save
      flash.notice = "Discount was created successfully!"
      redirect_to merchant_discounts_path(params[:merchant_id])
    else
      flash[:error] = @discount.errors.full_messages
      redirect_to new_merchant_discount_path(@merchant)
    end
  end

  def destroy
    Discount.destroy(params[:id])
    redirect_to merchant_discounts_path(@merchant)
  end

  private

  def set_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  def discount_params
    params.require(:discount).permit(:threshold, :percent)
  end
end
