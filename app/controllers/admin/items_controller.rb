class Admin::ItemsController < Admin::BaseController
  def index
    @q = params[:q].to_s.strip

    @items = Item
      .search_by_name(@q)
      .order(:name)
      .page(params[:page])
      .per(20)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to admin_items_path, notice: "アイテム情報を更新しました。"
    else
      flash.now[:alert] = "アイテム情報の更新に失敗しました。"
      render :edit, status: :unprocessable_content
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end
end