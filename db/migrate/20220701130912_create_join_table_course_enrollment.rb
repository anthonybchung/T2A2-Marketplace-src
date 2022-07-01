class CreateJoinTableCourseEnrollment < ActiveRecord::Migration[7.0]
  def change
    create_join_table :courses, :enrollments, column_options: { null: true }

  end
end
