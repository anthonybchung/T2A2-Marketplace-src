class AddPaidToPassengers < ActiveRecord::Migration[7.0]
  def change
    add_column :passengers, :paid, :boolean
  end
end
