class Passenger < ApplicationRecord
  belongs_to :user
  belongs_to :group

  add_index :passengers, [user_id, group_id], unique: true
end
