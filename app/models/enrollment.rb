class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  # add_index :enrollments, [user_id, course_id], unique: true
end
