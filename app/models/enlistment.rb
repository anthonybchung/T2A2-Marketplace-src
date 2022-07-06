class Enlistment < ApplicationRecord
    #from the many-to-many relationship
    # Enlist belongs to a user and an excursion.
    belongs_to :user
    belongs_to :excursion
end
