class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.integer :month
      t.boolean :active

      t.timestamps
    end
  end
end
