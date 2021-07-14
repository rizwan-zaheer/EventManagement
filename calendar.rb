require_relative 'event'
require_relative 'validation'
require_relative 'delete_events'

class Calendar

  # Add Event
  def self.add(total_events)
    p "Event Date:"
    date=gets.chomp 
    if !Validation.validate_date(date)
      return false
    end
    p "Event Title:"
    title=gets.chomp
    if Validation.check_string(title)
      return false
    end
    p "Event Desc:"
    desc=gets.chomp
    if Validation.check_string(desc)
      return false
    end
    flag=false
    total_events.each_with_index do |event,index|
      if event.has_key?(date) 
        newevent=Event.new(title,desc)
        event[date][index+1]=newevent
        flag=true
      end
    end
    if(!flag)
      event=Event.new(title,desc)
      arr_of_events=[]
      arr_of_events.push event
      hash={date=>arr_of_events}
      total_events<<hash
    end
    true
  end
  #Modify Event
  def self.modify(total_events)
    p "Enter date on which you modify event:"
    date=gets.chomp
    if !Validation.validate_date(date)
      return false
    end

    p "Enter Event Title:"
    title=gets.chomp
    if Validation.check_string(title)
      return false
    end

    total_events.each_with_index do |event,index|
      if event.has_key?(date) &&  event[date][index].title==title
      puts "Enter NewTitle:"
      newtitle=gets.chomp
      if Validation.check_string(newtitle)
        return false
      end
      puts "Enter NewDesc:"
      newdesc=gets.chomp
      if Validation.check_string(newdesc)
        return false
      end
      event[date][index].title=newtitle
      event[date][index].desc=newdesc
      return true
      else
        return '0'
      end
    end
  end

  #Delete Event

  def self.delete(total_events)
    puts "Enter date on which you want to delete event:"
    date=gets.chomp
    if !Validation.validate_date(date)
      return false
    end
    puts "1:Single Event on a Date"
    puts "2:All Events on a Date"
    puts "3:All Events in a month"
    loop do
      choice =gets.chomp
      if choice=="1"
        if Delete::single_event(total_events,date)
          p 'Event Deleted Successfully'
          break
        else Delete::single_event(total_events,date)
          p 'Invalid title name or no event exist at this date'
        end

      elsif choice=="2"
        if Delete::all_events_on_Date(total_events,date)
          p "Events Deleted Successfully"
          break
        else
          p 'No Event exist at this date'
        end
      elsif choice=="3"
        if Delete::all_events_on_month(total_events,date)
          p "Events deleted successfully"
          break
        else
          p 'No Event exist at this date'
        end
      else
        p "Please enter right option"
        break
      end
    end
  end
  # Calendar View
#   def self.view(total_events)
#     total_events.each_with_index do |event,index|
#       count=0
#       event[date].each_with_index do |obj,i|
#         count=i
#       end
#       puts event[date]
#     end
#   end
# end