class AddUserExcursionRefToEnlistments < ActiveRecord::Migration[7.0]
  def change
    add_reference :enlistments, :user, null: false, foreign_key: true
    add_reference :enlistments, :excursion, null: false, foreign_key: true
  end
end
