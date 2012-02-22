atom_feed do |feed|
  feed.title("The Holidays News Feed")
  feed.updated(@holiday.first.created_at)
  @holiday.each do |holiday|
    feed.entry(holiday) do |entry|
      entry.title(holiday.dateleaving)
      entry.content(holiday.datereturning)
    end
  end
end