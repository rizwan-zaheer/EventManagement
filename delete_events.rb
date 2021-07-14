class Delete
  # single Event on a Date
  def self.single_event(total_events,date)
    total_events.each_with_index do |event,index|
      if event.has_key?(date)
        p 'Enter Title to Delete:'
        title=gets.chomp
        if Validation.check_string(title)
          return false
        end
        event[date].each_with_index do |obj,i|
          #puts obj
          if obj.title==title
            event[date].delete_at(i)
            return true
          end
        end
      end
    end
  end
  # AllEvents on a Date
  def self.all_events_on_Date(total_events,date)
    total_events.each_with_index do |event,index|
      if event.has_key?(date)
        event.tap { |h| h.delete(date) }
        return true
      end
    end
    return false
  end
  # delete all events on a month
  def self.all_events_on_month(total_events,date)
    d_g,m_g,y_g=date.split('-')
    total_events.each_with_index do |event,index|
      if event.has_key?(date)
        event.each_pair do |key,value| 
           puts key
           d,m,y=key.split("-") 
           if m==m_g
            event.tap { |h| h.delete(date) }
            return true
           end
        end
      end
    end
    return false
  end
end
