require_relative 'calendar'
total_events=[]
loop do 
  p '1:Add Event'
  p '2:Modify Event'
  p '3:Delete Event'
  p '4:Calendar View'
  p '5:Exit'
  choice=gets.chomp
  if choice=='1'
    if Calendar.add(total_events)
      p 'Event Add Successfuly'
    else !Calendar.add(total_events)
      p 'Check your date or title'
    end
  elsif choice=='2'
    if Calendar.modify(total_events)
      p 'Event Modify Successfully'
    elsif !Calendar.modify(total_events)
      p 'Check your date or title'
    else
      p 'No event exist at this date or title'
    end
  elsif choice=='3'
    Calendar.delete(total_events)
  elsif choice=='4'
    Calendar.view(total_events) 
  elsif choice=='5'
    break
  else
    p 'Select Right Option'
  end
  p total_events
end