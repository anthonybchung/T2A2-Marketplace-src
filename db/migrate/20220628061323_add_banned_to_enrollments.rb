class AddBannedToEnrollments < ActiveRecord::Migration[7.0]
  def change
    add_column :enrollments, :banned, :boolean
  end
end
