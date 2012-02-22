class AddSnameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :sname, :string
  end

  def self.down
    remove_column :users, :sname
  end
end
