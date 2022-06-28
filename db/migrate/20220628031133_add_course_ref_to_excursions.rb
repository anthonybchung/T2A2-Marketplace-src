class AddCourseRefToExcursions < ActiveRecord::Migration[7.0]
  def change
    add_reference :excursions, :course, null: false, foreign_key: true
  end
end
