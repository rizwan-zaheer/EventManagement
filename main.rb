require_relative 'calendar'
require_relative 'helper'
# Module
module Main
  calendar = Calendar.new({})
  loop do
    p '1:Add Event'
    p '2:Modify Event'
    p '3:Delete Event'
    p '4:Calendar View'
    p '5:Exit'
    choice = gets.chomp
    case choice
    when '1'
      p 'Please check your date or title/desc' unless calendar.add
    when '2'
      p 'Please check your date or title' unless calendar.modify
    when '3'
      p '1:Single event on a date'
      p '2:All events on a date'
      p '3:All events on a month'
      choice2 = gets.chomp
      case choice2
      when '1'
        p 'Check date and title or no event exist at this date' unless calendar.single_event(choice2)
      when '2'
        p 'Check date or no event exist at this date' unless calendar.all_events_on_Date(choice2)
      when '3'
        p 'Check date or no event exist at this date' unless calendar.all_events_on_month(choice2)
      else
        p 'select right option'
      end
    when '4'
      calendar.view
    when '5'
      break
    else
      p 'Please select right option'
    end
  end
end


