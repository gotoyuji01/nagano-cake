class Public::ItemsController < ApplicationController
  def index
      # 商品が販売中の商品のみ表示させる
      @items_all = Item.where(is_active: true).order("id DESC").limit(8)
      @items = @items_all.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end


end
