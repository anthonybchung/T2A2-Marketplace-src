class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.text :description
      t.integer :total_cost
      t.integer :passenger_no
      t.references :user, null: false, foreign_key: true
      t.references :excursion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
