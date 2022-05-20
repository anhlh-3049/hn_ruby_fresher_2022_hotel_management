class Admin::RoomViewsController < Admin::AdminController
  def index
    @pagy, @room_views = pagy RoomView.all
  end

  def new
    @room_view = RoomView.new
  end

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

  private
  def room_view_params
    params.require(:room_view).permit :name
  end
end
