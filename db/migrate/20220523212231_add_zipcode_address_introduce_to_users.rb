class AddZipcodeAddressIntroduceToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zipcode, :text
    add_column :users, :address, :text
    add_column :users, :introduce, :text
  end
end
