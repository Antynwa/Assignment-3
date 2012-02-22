class AddFnameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fname, :string
  end

  def self.down
    remove_column :users, :fname
  end
end
