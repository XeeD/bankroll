class AddUserIdToCasinos < ActiveRecord::Migration
  def change
    add_column :casinos, :user_id, :integer
  end
end
