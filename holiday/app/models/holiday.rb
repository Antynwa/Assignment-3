class Holiday < ActiveRecord::Base
belongs_to :user

  validates_presence_of :dateleaving
  validates_presence_of :datereturning

end

