require_relative 'calendar'
require_relative 'helper'
require_relative 'input'
# Module
module Main
  extend Input
  calendar = Calendar.new({})
  loop do
    p '1:Add Event'
    p '2:Modify Event'
    p '3:Delete Single Event'
    p '4:Delete All Events on date'
    p '5:Delete All Events on Mont'
    p '6::Calendar View'
    p '7::Exit'
    choice = gets.chomp
    case choice
    when '1'
      user_input = input_for_add
      if user_input
        p 'Event Add Successfully' if calendar.add(user_input)
      else
        p 'Please check your date or title/desc'
      end
    when '2'
      user_input = input_for_modify
      if user_input
        p 'Event Modify Successfully' if calendar.modify(user_input)
      else
        p 'Please check your date or title/desc'
      end
    when '3'
      user_input = input_for_single_event
      if user_input
        p 'Event deleted Successfully' if calendar.single_event(user_input)
      else
        p 'Please check your date or title/desc'
      end
    when '4'
      user_input = input_for_all_event_on_date
      if user_input
        p 'Event deleted Successfully' if calendar.all_events_on_Date(user_input)
      else
        p 'Please check your date or title/desc'
      end
    when '5'
      p 'Enter month:'
      month = gets.chomp
      p 'Event deleted Successfully' if calendar.all_events_on_month(month)
    when '6'
      calendar.view
    else
      p 'Please select right option'
    end
  end
end
