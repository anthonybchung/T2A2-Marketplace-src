class AddSuburbToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :suburb, :string
  end
end
