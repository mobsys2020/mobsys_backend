class AddDefaultValueToShowAttribute < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :doctor, :boolean, default: false
  end
end
