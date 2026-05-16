class Admin::ItemsController < Admin::BaseController
  def index
    @q = params[:q].to_s.strip

    @items = Item
      .search_by_name(@q)
      .order(:name)
      .page(params[:page])
      .per(20)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to edit_admin_item_path(@item), notice: "アイテムを追加しました。必要数はタスク編集画面またはアイテム編集画面から設定してください。"
    else
      flash.now[:alert] = "アイテムの追加に失敗しました。入力内容を確認してください。"
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @item = Item.find(params[:id])
    set_required_quantity_records
  end

  def update
    @item = Item.find(params[:id])

    ActiveRecord::Base.transaction do
      @item.update!(item_params)
      update_required_quantities(@item.item_tasks, params[:item_task_required_quantities])
      update_required_quantities(@item.item_hideouts, params[:item_hideout_required_quantities])
    end

    redirect_to admin_items_path, notice: "アイテム情報を更新しました。"
  rescue ActiveRecord::RecordInvalid
    set_required_quantity_records
    flash.now[:alert] = "アイテム情報の更新に失敗しました。入力内容を確認してください。"
    render :edit, status: :unprocessable_content
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end

  def set_required_quantity_records
    @item_tasks = @item
      .item_tasks
      .joins(:task)
      .includes(:task)
      .order("tasks.level ASC, tasks.trader ASC, tasks.name ASC")

    @item_hideouts = @item
      .item_hideouts
      .joins(:hideout)
      .includes(:hideout)
      .order("hideouts.name ASC")
  end

  def update_required_quantities(records, quantity_params)
    return if quantity_params.blank?

    records.each do |record|
      next unless quantity_params.key?(record.id.to_s)

      record.update!(required_quantity: quantity_params[record.id.to_s])
    end
  end
end
