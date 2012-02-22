class CreateHolidays < ActiveRecord::Migration
  def self.up
    create_table :holidays do |t|
      t.date :dateleaving
      t.date :datereturning
      t.boolean :approved
      t.boolean :declined
      t.string :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :holidays
  end
end
