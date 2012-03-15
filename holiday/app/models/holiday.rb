class Holiday < ActiveRecord::Base
belongs_to :user

  validates_presence_of :dateleaving
  validates_presence_of :datereturning
  
  has_attached_file :photo, :styles => { :small => "150x150>" },
                    :url  => "/assets/holidays/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/holidays/:id/:style/:basename.:extension"

 
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end

