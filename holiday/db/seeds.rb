require 'faker' 
require 'populator'
require 'sha1'

User.destroy_all 
Holiday.destroy_all

10.times do
  user = User.new 
  user.username = Faker::Internet.user_name
  user.email = Faker::Internet.email
  user.password = "test"
  user.password_confirmation = "test"
  user.fname = Faker::Name.first_name
  user.sname = Faker::Name.last_name
  user.save
end

User.all.each do |user|
  Holiday.populate(5..10) do |holiday|
    holiday.dateleaving = "2012/01/01"
    holiday.datereturning = "2012/03/03"
    holiday.user_id = user.id
end
end