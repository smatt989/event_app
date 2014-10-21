class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digeset, :string
  end
end
