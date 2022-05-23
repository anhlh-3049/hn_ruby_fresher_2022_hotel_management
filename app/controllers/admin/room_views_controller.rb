class Admin::RoomViewsController < Admin::AdminController
  before_action :find_room_view, only: %i(edit update destroy)

  def index
    @pagy, @room_views = pagy RoomView.all
  end

  def new
    @room_view = RoomView.new
  end

  def edit; end

  def create
    @room_view = RoomView.new room_view_params
    if @room_view.save
      flash[:success] = t ".flash_sucsses"
      redirect_to admin_room_views_path
    else
      flash[:error] = t ".flash_error"
      render :new
    end
  end

  def update
    if @room_view.update room_view_params
      flash[:success] = t ".flash_sucsses"
      redirect_to admin_room_views_path
    else
      flash[:danger] = t ".flash_error"
      render :edit
    end
  end

  def destroy
    @room_view.destroy
    flash[:success] = t ".flash_sucsses"
    redirect_to admin_room_views_path
  end

  private
  def find_room_view
    @room_view = RoomView.find_by(id: params[:id])
    flash[:danger] = t ".flash_error"
    redirect_to admin_room_views_path unless @room_view
  end

  def room_view_params
    params.require(:room_view).permit :name
  end
end
