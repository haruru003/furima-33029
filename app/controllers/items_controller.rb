class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
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
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :introduction, :category_id, :item_condition_id, :postage_payer_id, :prefecture_code_id, :preparation_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    unless item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
