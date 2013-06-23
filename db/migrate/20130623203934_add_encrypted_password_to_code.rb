class AddEncryptedPasswordToCode < ActiveRecord::Migration
  def change
    add_column :codes, :encrypted_password, :string
    remove_column :codes, :password
  end
end
