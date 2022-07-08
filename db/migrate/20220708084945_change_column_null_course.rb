class ChangeColumnNullCourse < ActiveRecord::Migration[7.0]
  def change
    change_column_null :courses, :name, false
    change_column_null :excursions, :name,false
  end
end
