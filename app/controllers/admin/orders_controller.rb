class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    # 下記３行は商品合計を出すため
    @sum = 0
    @subtotals = @order_details.map { |order_details| order_details.price * order_details.amount }
    @sum = @subtotals.sum
  end
  
  def order_status_update
    @order = Order.find(params[:order][:id])
    if @order.update(params_int(order_params))
      flash[:success] = "注文ステータスを更新しました"
      order_status_is_deposited?(@order)
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "注文ステータスの更新に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def order_details_status_update
    @order_details = OrderDetails.find(params[:order_details][:id])
    if @order_details.update(params_int(order_details_params))
      flash[:info] = "製作ステータスを更新しました"
      order_details_status_is_in_production?(@order_details)
      @order = Order.find_by(id: params[:order_details][:order_id])
      order_details_status_is_production_complete?(@order)
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "製作ステータスの更新に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_details_params
    params.require(:order_details).permit(:order_details_status, :id)
  end
  
end
