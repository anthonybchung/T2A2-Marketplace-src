class Excursion < ApplicationRecord
    belongs_to :course

    has_many :enlistments
    has_many :users, through: :enlistments

    has_many :groups

    has_many :passengers, through: :groups

    has_one_attached :image
end
