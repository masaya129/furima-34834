class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]
  
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
  end

  def edit
  end

  def update
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

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end
