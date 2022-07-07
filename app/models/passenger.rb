class Passenger < ApplicationRecord
  validates :user_id, presence: true
  validates :group_id, presence: true
  #many-to-many relationship between users and groups.
  belongs_to :user
  belongs_to :group

end
