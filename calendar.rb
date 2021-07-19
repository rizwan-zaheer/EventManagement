require_relative 'event'
require_relative 'helper'
require_relative 'input'
# Calendar class
class Calendar
  include Input

  def initialize(total_events)
    @total_events = total_events
  end
  # add event
  def add

    user_input = input_for_add
    return false unless user_input
    
    date, title, desc = user_input
    flag = false
    @total_events.each do |key, value|
      next unless key == (date)

      new_event = Event.new(title, desc)
      value.push new_event
      flag = true
    end
    unless flag
      new_event = Event.new(title, desc)
      @total_events[date] = [new_event]
    end
    p 'Event add successfully'
    p @total_events
    true
  end
  # modify event
  def modify

    user_input = input_for_modify
    return false unless user_input

    date, title, new_title, new_desc = user_input
    @total_events.each do |key, value|
      next unless key == date

      value.each do |event|
        next unless event.title == title

        event.title = new_title
        event.desc = new_desc
        p 'Event Modify Successfully'
        p @total_events
        return true
      end
      p 'No Event match to your date or title'
    end
    false
  end
  # single event on date
  def single_event(choice)

    user_input = delete_events(choice)
    return false unless user_input

    date, title = user_input

    @total_events.each do |key, value|
      next unless key == date

      value.each do |event|
        next unless event.title == title

        value.pop
        p 'Event deleted successfully'
        p @total_events
        return true
      end
    end
    p 'No event match to your title or date'
    false
  end
  # all events on date
  def all_events_on_Date(choice)

    user_input = delete_events(choice)
    return false unless user_input

    date = user_input

    @total_events.each do |key, _value|
      next unless key == date

      @total_events.tap { |events| events.delete(key) }
      p 'Events deleted successfully'
      p @total_events
      return true
    end
  end
  # all events on month
  def all_events_on_month(choice)

    user_input = delete_events(choice)
    return false unless user_input
    
    month = user_input

    flag = false
    @total_events.each do |key, _value|
      _key_day, key_month, _key_year = key.split('-')
      next unless key_month == month

      @total_events.tap { |events| events.delete(key) }
      p 'Events deleted successfully'
      p @total_events
      flag = true
    end
    flag ? true : false
  end
  # calendar view

  def view

    @total_events.each do |key, value|
      p "#{key}  =>  #{value.size} event"
    end
  end
end
