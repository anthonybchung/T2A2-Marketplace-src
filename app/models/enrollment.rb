class Enrollment < ApplicationRecord
  #through the many-to-many relationship of Users and Courses.
  #An enrollment belongs to a user and a course.
  belongs_to :user
  belongs_to :course

  
end
