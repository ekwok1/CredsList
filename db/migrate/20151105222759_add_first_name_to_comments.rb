class AddFirstNameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :first_name, :string
  end
end
