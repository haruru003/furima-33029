class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:index, :show, :new, :create]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
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


end
