class CreateExcursions < ActiveRecord::Migration[7.0]
  def change
    create_table :excursions do |t|
      t.string :name
      t.text :description
      t.datetime :arrive_time
      t.string :street_number
      t.string :street_name
      t.string :suburb
      t.string :city
      t.integer :state
      t.integer :post_code

      t.timestamps
    end
  end
end
