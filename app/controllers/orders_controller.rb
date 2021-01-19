class OrdersController < ApplicationController
  
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create, :pay_item, :move_to_index]
  before_action :move_to_index, only: [:index, :create]
  

  def index
    @order_adress = OrderAdress.new
  end

  def create
    @order_adress = OrderAdress.new(order_params)
   
    if @order_adress.valid?
      pay_item
      @order_adress.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_adress).permit(:post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
  
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def move_to_index
   
    if @item.user_id == current_user.id or @item.trading_record.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
