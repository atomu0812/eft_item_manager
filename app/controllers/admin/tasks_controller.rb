class Admin::TasksController < Admin::BaseController
  def index
    @q = params[:q].to_s.strip
    @trader = params[:trader].to_s.strip

    @tasks = Task.includes(:items)
    @tasks = @tasks.where("name ILIKE ?", "%#{@q}%") if @q.present?
    @tasks = @tasks.where(trader: @trader) if @trader.present?

    @tasks = @tasks
      .order(:level, :trader, :name)
      .page(params[:page])
      .per(20)

    set_trader_options
  end

  def new
    @task = Task.new(level: 1)
    set_trader_options
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to edit_admin_task_path(@task), notice: "タスクを追加しました。続けて必要アイテムを追加してください。"
    else
      set_trader_options
      flash.now[:alert] = "タスクの追加に失敗しました。入力内容を確認してください。"
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @task = Task.find(params[:id])
    set_trader_options
    set_item_task_records
    set_available_items
  end

  def update
    @task = Task.find(params[:id])

    ActiveRecord::Base.transaction do
      @task.update!(task_params)
      update_item_tasks
      add_item_task
    end

    redirect_to edit_admin_task_path(@task), notice: "タスク情報を更新しました。"
  rescue ActiveRecord::RecordInvalid
    set_trader_options
    set_item_task_records
    set_available_items
    flash.now[:alert] = "タスク情報の更新に失敗しました。入力内容を確認してください。"
    render :edit, status: :unprocessable_content
  end

  private

  def task_params
    params.require(:task).permit(:name, :trader, :level, :description)
  end

  def set_trader_options
    @traders = Task
      .where.not(trader: [nil, ""])
      .distinct
      .order(:trader)
      .pluck(:trader)
  end

  def set_item_task_records
    @item_tasks = @task
      .item_tasks
      .includes(:item)
      .joins(:item)
      .order("items.name ASC")
  end

  def set_available_items
    @item_q = params[:item_q].to_s.strip

    @available_items = Item
      .where.not(id: @task.item_tasks.select(:item_id))
      .search_by_name(@item_q)
      .order(:name)
  end

  def update_item_tasks
    delete_ids = Array(params[:delete_item_task_ids]).map(&:to_i)
    @task.item_tasks.where(id: delete_ids).destroy_all if delete_ids.any?

    quantity_params = params[:item_task_required_quantities]
    return if quantity_params.blank?

    @task.item_tasks.where(id: quantity_params.keys).find_each do |item_task|
      next if delete_ids.include?(item_task.id)

      item_task.update!(required_quantity: quantity_params[item_task.id.to_s])
    end
  end

  def add_item_task
    item_name = params[:new_item_name].to_s.strip
    return if item_name.blank?

    item = Item.find_by(name: item_name)

    unless item
      @task.errors.add(:base, "追加するアイテムは候補から選択してください。")
      raise ActiveRecord::RecordInvalid, @task
    end

    required_quantity = params[:new_required_quantity].presence || 1

    item_task = @task.item_tasks.find_or_initialize_by(item: item)
    item_task.required_quantity = required_quantity
    item_task.save!
  end
end
