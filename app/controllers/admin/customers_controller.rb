class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  # 全体を通して記述している「.with_deleted」は論理削除したテーブルを含めるための記述。
  # paranoiaのgemの効果で.with_deletedを使用しない普通のやり方だと論理削除したテーブルを除外してくれる。
  # 例えば　Client.all と書くと普通はclientモデルの中身全てを参照するが、paranoiaのgemにより論理削除したテーブルを参照しなくなる。
  def show
    #@customer = Customer.with_deleted.find(params[:id])
    @customer = Customer.find(params[:id])
  end

  # kaminariのgemを適用するためpageの記述を入れている。
  def index
    #@customers = Customer.with_deleted.page(params[:page]).per(10)
    @customers = Customer.page(params[:page]).per(10)
  end

  def edit
    #@customer = Customer.with_deleted.find(params[:id])
    @customer = Customer.find(params[:id])
  end

  def update
    #@customer = Customer.with_deleted.find(params[:id])
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = '個人情報を編集しました'
      redirect_to admin_customer_path(@customer)
    else
      flash[:danger] = '個人情報の編集に失敗しました'
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :telephone_number, :postal_code, :address, :is_deleted)
  end
end
