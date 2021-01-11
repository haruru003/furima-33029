class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
    #@item = Item.all
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

  private
  def item_params
    params.require(:item).permit(:item_name, :introduction, :category_id, :item_condition_id, :postage_payer_id, :prefecture_code_id, :preparation_day_id, :price, :image).marge(user_id: current_user.id, item_id: params[:item_id])
  end

end
