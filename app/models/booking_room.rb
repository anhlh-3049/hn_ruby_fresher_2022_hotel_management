class BookingRoom < ApplicationRecord
  UPDATETABLE_ATTRS = %i(description name phone_number from_date to_date
    room_id).freeze

  belongs_to :user
  belongs_to :room

  enum status: {booking:0, approve:1, cancelled:2}
end
