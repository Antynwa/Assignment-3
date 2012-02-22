class RemoveUserIdFromHoliday < ActiveRecord::Migration
  def self.up
    remove_column :holidays, :user_id
  end

  def self.down
    add_column :holidays, :user_id, :integer
  end
end
