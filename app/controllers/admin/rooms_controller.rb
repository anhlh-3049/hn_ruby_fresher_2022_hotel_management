class Admin::RoomsController < Admin::AdminController
  before_action :find_room, only: %i(edit update)

  def index
    @pagy, @rooms = pagy Room.all, items:
      Settings.admin.room_view.pagy.max_length
  end

  def new
    @room = Room.new
    @image = @room.images.build
  end

  def create
    @room = Room.new room_params
    if @room.save
      flash[:success] = t ".flash_sucsses"
      redirect_to admin_rooms_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @room.update room_params
      flash[:success] = t ".room_updated"
      redirect_to admin_rooms_path
    else
      render :edit
    end
  end

  private
  def find_room
    @room = Room.find_by(id: params[:id])
    redirect_to admin_rooms_path unless @room
  end

  def room_params
    params.require(:room).permit(Room::UPDATETABLE_ATTRS)
  end
end
