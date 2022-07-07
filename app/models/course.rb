class Course < ApplicationRecord
    #Validation
    validates :name, presence: true

    # A course is created by a User, thus it belongs to a User.
    belongs_to :user
    # A teacher can create many excursions within a course.
    #thus a Course has many excursions.
    has_many :excursions

    # A course is accept many enrollments. Thus can have many users through these enrollments.
    has_many :enrollments
    has_many :users, through: :enrollments

    
end
