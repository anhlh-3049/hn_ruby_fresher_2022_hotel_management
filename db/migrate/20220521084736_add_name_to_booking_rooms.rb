class AddNameToBookingRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :booking_rooms, :name, :string
    add_column :booking_rooms, :phone_number, :integer
  end
end
