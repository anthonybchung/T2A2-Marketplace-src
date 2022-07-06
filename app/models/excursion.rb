class Excursion < ApplicationRecord
    belongs_to :course

    has_many :enlistments
    has_many :users, through: :enlistments

    has_many :groups

    has_many :passengers, through: :groups

    has_one_attached :image

    enum state: {
        ACT: 1,
        QLD: 2,
        NSW: 3,
        NT: 4,
        SA: 5,
        TAS: 6,
        WA: 7
    }
end
