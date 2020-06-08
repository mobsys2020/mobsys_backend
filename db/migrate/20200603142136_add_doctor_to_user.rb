class AddDoctorToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :doctor, :boolean
  end
end
