class Code < ActiveRecord::Migration
  def up
    add_column :codes, :user_id, :integer
  end

  def down
    remove_column :codes, :user_id
  end
end
