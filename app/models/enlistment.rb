class Enlistment < ApplicationRecord
    belongs_to :user
    belongs_to :excursion

    add_lindex :enlistments, [:user_id, :enlistment_id], unique: true
end
