class Passenger < ApplicationRecord

  #many-to-many relationship between users and groups.
  belongs_to :user
  belongs_to :group

end
