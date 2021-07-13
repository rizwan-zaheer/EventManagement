require 'date'
#validate date
def validate_date(date)
  format_ok = date.match(/\d{2}-\d{2}-\d{4}/)
  parseable = Date.strptime(date, '%Y-%m-%d') rescue false

  if date== 'never' || format_ok && parseable
    return true
  else
   return false
  end
end
##validate string
def check_string(string)
  string.scan(/\D/).empty?
end
#AddEvent
module AddEvent
    def add(total_events)
        puts "Event Date:"
        newdate=gets.chomp 
        if !validate_date(newdate)
          return p "Please enter a date in format like (%Y-%m-%d)"
        end

        p "Event Title:"
        newtitle=gets.chomp
        if check_string(newtitle)
          return p "Title not contain only Digits"
        end
      
          hash={date:newdate,title:newtitle}
          total_events<<hash
          p "Event Add Successfully"
    end
end

#Modify Event
module ModifyEvent
    def modifyEvent(total_events)
        p "Enter date to which you Modify Event:"
        date=gets.chomp
        if !validate_date(date)
          return p "Please enter a date in format like (%d-%m-%Y)"
        end
            puts "Event NewDate:"
            newdate=gets.chomp 
            p "Event NewTitle:"
            if !validate_date(newdate)
              return p "Please enter a date in format like (%d-%m-%Y)"
            end
            newtitle=gets.chomp
            if check_string(newtitle)
              return p "Please Enter string"
            end

            for i in 0..total_events.length-1
              if total_events[i][:date]==date
                total_events[i][:date]=newdate
                total_events[i][:title]=newtitle
              end
            end
            p "Event Modify Successfully"
        end
    
      end

#DeleteSingleEvent
def singleEvent(total_events,date)
  size=total_events.length
  events=total_events.select{|h| h[:date]==date}
  if events.length>1
    puts "More than one event exist at this date"
    puts "Enter title name to delete"
    title=gets.chomp
    total_events.delete_if{ |h| h[:title]==title}
    if size>total_events.length
      p "Event Deleted Successfully"
    else
      p "No Event exist of title:#{title}"
    end
  else
    total_events.delete_if{ |h| h[:date]==date}
  if size>total_events.length
    p "Event Deleted Successfully"
  else
    p "No Event exist at that date"
  end
  end
end

#AllEventsOnDate
def allEventsOnDate(total_events,date)
  size=total_events.length
  for i in 0..total_events.length-1
    total_events.delete_if {|h| h[:date]==date}
  end
  if size>total_events.length
    p "Events Deleted Successfully"
  else
    p "No Event exist at that date"
  end
end
#AllEvents on Month
def allEventsOnMonth(total_events,date)
  d_g,m_g,y_g=date.split('-')
  for i in 0..total_events.length-1
    ndate=total_events[i][:date]
    d,m,y=ndate.split('-')
    if m==m_g
      total_events.delete_if {|h| h[:date]==date}
      return p "Event Deleted Successfully"
    end
  end
  return p "No Event exist at this date"
  #p total_events
end
#Delete Module12
module DeleteEvent
    def deleteEvent(total_events)
      puts "Enter date on which you want to delete event:"
      date=gets.chomp
      if !validate_date(date)
        return p "Please enter a date in format like (%d-%m-%Y)"
      end
      puts "1:Single Event on a Date"
      puts "2:All Events on a Date"
      puts "3:All Events in a month"
      loop do
        choice =gets.chomp
        if(choice=="1")
          singleEvent(total_events,date)
        elsif choice=="2"
          allEventsOnDate(total_events,date)
        elsif choice=="3"
          allEventsOnMonth(total_events,date)
        else
          p "Please enter right option"
          break
        end
      end
    end
end
        


#Calendar View
module CalendarView
  def showEvents(total_events)
    puts "     Date            No of Events"
    for i in 0..total_events.length-1
      count=total_events.select {|h| h[:date]==total_events[i][:date]}
      puts "#{total_events[i][:date]}                  #{count.length}"
    end
  end
end

class Event 
    include AddEvent
    include ModifyEvent
    include DeleteEvent
    include CalendarView
    attr_accessor:date,:title
end

total_events=[]
event=Event.new

        p "Add Event"
        event.add(total_events)
        p total_events
    loop do
        puts "1:Add Event"
        puts "2:Modify Event"
        puts "3:Delete Event"
        puts "4:Calendar View"
        puts "5:Exit Program"
        choice=gets.chomp
        if choice=="1"
            event.add(total_events)
        elsif choice=="2"
            event.modifyEvent(total_events)
        elsif choice=="3"
            event.deleteEvent(total_events)
        elsif choice=="4"
            event.showEvents(total_events)
        elsif choice=="5"
            break
        else
          p "Please enter right option"
        end

        puts "CURRENT EVENTS::#{total_events}"
    end
    

