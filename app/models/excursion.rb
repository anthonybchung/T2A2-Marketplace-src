class Excursion < ApplicationRecord
    belongs_to :course

    has_many :enlistments
    has_many :users, through: :enlistments

    has_many :groups
end