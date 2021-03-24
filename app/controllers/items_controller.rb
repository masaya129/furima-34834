class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
    
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
     if @item.save
        redirect_to root_path
     else
        render :new
     end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
  end
  private

  def item_params
    params.require(:item).permit(:name, :concept, :image, :category_id, :item_status_id, :delivery_price_id, :delivery_area_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :concept, :category_id, :item_status_id, :delivery_price_id, :delivery_area_id, :delivery_date_id, :price)
  end
end
