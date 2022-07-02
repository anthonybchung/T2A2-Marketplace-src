class AddBannedDefaultValueTruetoEnrollment < ActiveRecord::Migration[7.0]
  def change
    change_column_default :enrollments, :banned, from: true, to: false
  end
end
