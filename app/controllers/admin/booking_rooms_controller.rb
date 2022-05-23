class Admin::BookingRoomsController < Admin::AdminController
  before_action :find_user_tour, only: :update

  def index
    @pagy, @booking_rooms = pagy BookingRoom.all
  end

  def update
    @booking_room.update status: (booking_params[:status])
      redirect_to admin_booking_rooms_path
  end

  private
    def find_user_tour
       @booking_room = BookingRoom.find_by(id: params[:id])
      redirect_to admin_booking_rooms_path unless @booking_room
    end

    def booking_params
      params.require(:booking_room).permit :status
    end
end
