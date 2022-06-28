class CreateEnlistments < ActiveRecord::Migration[7.0]
  def change
    create_table :enlistments do |t|

      t.timestamps
    end
  end
end
