class ChangeDatatypeZipcodeOfUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :zipcode, :text
  end

  def down
    change_column :users, :zipcode, :integer
  end
end
