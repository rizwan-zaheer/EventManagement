require_relative 'calendar'
require_relative 'helper'
require_relative 'input'
# Module
module Main
  extend Input
  loop do
    p '1:Add Event'
    p '2:Modify Event'
    p '3:Delete Event'
    p '4:Calendar View'
    p '5:Exit'
    choice = gets.chomp
    case choice
    when '1'
      p 'Please check your date or title/desc' unless Calendar.add
    when '2'
      p 'Please check your date or title' unless Calendar.modify
    when '3'
      p 'Please check your date or title' unless delete_events
    when '4'
      Calendar.view
    when '5'
      break
    else
      p 'Please select right option'
    end
    p $total_events
  end
end


