class Enrollment < ApplicationRecord
  validates :course_id, presence: true
  validates :user_id, presence: true
  
  #through the many-to-many relationship of Users and Courses.
  #An enrollment belongs to a user and a course.
  belongs_to :user
  belongs_to :course

  
end
