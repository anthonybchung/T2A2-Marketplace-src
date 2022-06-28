class Enlistment < ApplicationRecord
    belongs_to :user
    belongs_to :excursion
end
