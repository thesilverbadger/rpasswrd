class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :code
      t.string :password
      t.string :username
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
