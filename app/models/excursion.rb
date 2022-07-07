class Excursion < ApplicationRecord
    #An excursion must have a name.
    validates :name, presence: true

    #A course is created within a Course, thus it belongs to a course.
    belongs_to :course

    #An Excursion can accept many users.
    #Many-to-many relationship.
    #Thus an excursion can have many users through enlistments.
    has_many :enlistments
    has_many :users, through: :enlistments

    #Users can be a driver and create their own groups for that excursion.
    #Thus an excursion has many groups.
    has_many :groups

    #A user a passenger in that group that belongs to an excursion.
    has_many :passengers, through: :groups

    #A teacher can up load a photo of the excursion place or map.
    has_one_attached :image

    #To save space and increase database efficiency. Enum is used for States.
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
