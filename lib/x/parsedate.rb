class ParseDate
  def self.parsedate date_str
    first, second, third = date_str.split(' ')

    if third =~ /^\d{4}$/ # If the third argument is a year (e.g., "2001")
      year = third.to_i
      month = first
      day = second
      t = Time.mktime(year, month, day)
      return [t.year, t.month, t.day,]
    else # If the third argument is a time (e.g., "14:50")
      month = first
      day = second
      hour_min = third
      t = Time.strptime("#{month} #{day} #{hour_min}", "%b %d %H:%M")
      return [t.year, t.month, t.day, t.hour, t.min]
    end
  end
end