class AddUat < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_access_token, :string, default: ""
  end
end
