class OrdersController < ApplicationController
  # before_action :sold_out_item, only: [:index, :show]
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    if current_user == @item.user
      redirect_to root_path
    end

    if @item.user_buy_address.present?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
      if @order.valid?
         pay_item
         @order.save
         redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_params
    params.require(:order).permit(:address_line, :delivery_area_id, :city, :block_number, :city_bill, :phone_number, :user_buy_address, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  # def sold_out_item
  #   redirect_to root_path if @item.user_buy_address.present?
  # end

  def pay_item
    Payjp.api_key = "sk_test_430f5f355fd88cc9012114ec"  
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],
      currency: 'jpy'  
    )
  end

  
end

