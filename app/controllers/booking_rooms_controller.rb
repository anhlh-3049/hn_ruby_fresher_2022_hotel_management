class BookingRoomsController < ApplicationController
  def index; end

  def create
    @booking_room = BookingRoom.new booking_room_params
    @room = Room.find_by(id: booking_room_params[:room_id])
    @booking_room.user_id = current_user.id
    if @booking_room.save
      flash[:success] = t ".flash_sucsses"
      redirect_to rooms_path
    else
      flash[:error] = t ".flash_error"
      render :index
  end

  private
    def booking_room_params
      params.require(:booking_room).permit(BookingRoom::UPDATETABLE_ATTRS)
    end
end
