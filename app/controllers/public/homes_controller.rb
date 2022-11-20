class Public::HomesController < ApplicationController
  def top
    @items = Item.where(is_active: true).order("id DESC").limit(4)
  end

  def about
  end
end
