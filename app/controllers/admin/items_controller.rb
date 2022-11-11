class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # 商品のカラムが存在しているかどうかのif文
    if params[:item][:price].present? && params[:item][:name].present? && params[:item][:introduction].present? && params[:item][:image].present?
      # 価格は半角数字0 ~ 9のみ登録可能で、それ以外は登録出来ないようにするif文
      if params[:item][:price].to_s.ord >= 48 && params[:item][:price].to_s.ord <= 57
        # 保存に成功した時のif文
        if @item.save
          redirect_to admin_item_path(@item.id)
          flash[:success] = "商品を登録しました"
        else
          flash[:danger] = "必要情報を入力してください"
          render "admin/items/new"
        end
      else
        flash[:danger] = "価格は半角数字で記入してください"
        redirect_to new_admin_item_path
      end
    else
      # 格カラムが空白で保存されなかった場合
      unless @item.save
        flash[:danger] = "必要情報を入力してください"
        render "admin/items/new"
      end
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
    # 商品のカラムが存在しているかどうかのif文
    if params[:item][:price].present? && params[:item][:name].present? && params[:item][:introduction].present? && params[:item][:image].present?
      # 価格は半角数字のみ登録可能で、それ以外は登録出来ないようにするif文
      if params[:item][:price].to_s.ord >= 48 && params[:item][:price].to_s.ord <= 57
        # 更新に成功した時のif文
        if @item.update(item_params)
          redirect_to admin_item_path(@item.id)
          flash[:success] = "商品を更新しました"
        else
          flash[:danger] = "必要情報を入力してください"
          render "admin/items/edit"
        end
      else
        flash[:danger] = "価格は半角数字で記入してください"
        # redirect_to edit_admins_product_path(@product.id)
        render "admin/items/edit"
      end
    else
      # 格カラムが空白で更新されなかった場合
      unless @item.update(item_params)
        flash[:danger] = "必要情報を入力してください"
        render "admin/items/edit"
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :is_active)
  end
  
  
end
