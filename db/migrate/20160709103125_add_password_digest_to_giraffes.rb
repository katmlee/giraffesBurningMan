class AddPasswordDigestToGiraffes < ActiveRecord::Migration
  def change
    add_column :giraffes, :password_digest, :string
    add_column :giraffes, :email, :string
  end
end
