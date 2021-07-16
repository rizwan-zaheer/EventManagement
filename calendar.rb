require_relative 'event'
require_relative 'helper'
require_relative 'input'
$total_events = {}
# Calendar class
class Calendar
  extend Input
  # add event
  def self.add
    user_input = input_for_add
    return false unless user_input

    date, title, desc = user_input
    flag = false
    $total_events.each do |key, value|
      next unless key == (date)

      new_event = Event.new(title, desc)
      value.push new_event
      flag = true
    end
    unless flag
      new_event = Event.new(title, desc)
      $total_events[date] = [new_event]
    end
    p 'Event add successfully'
    true
  end
  # modify event
  def self.modify

    user_input = input_for_modify
    return false unless user_input

    date, title, new_title, new_desc = user_input
    $total_events.each do |key, value|
      next unless key == date

      value.each do |event|
        next unless event.title == title

        event.title = new_title
        event.desc = new_desc
        p 'Event Modify Successfully'
        return true
      end
    end
    false
  end
  # single event on date
  def self.single_event(date, title)

    $total_events.each do |key, value|
      next unless key == date

      value.each do |event|
        next unless event.title == title

        value.pop
        p 'Event deleted successfully'
        return true
      end
    end
    p 'No event match to your title or date'
    false
  end
  # all events on date
  def self.all_events_on_Date(date)

    $total_events.each do |key, _value|
      next unless key == date

      $total_events.tap { |events| events.delete(key) }
      p 'Events deleted successfully'
      return true
    end
  end
  # all events on month
  def self.all_events_on_month(month)

    flag = false
    $total_events.each do |key, _value|
      _key_day, key_month, _key_year = key.split('-')
      next unless key_month == month

      $total_events.tap { |events| events.delete(key) }
      p 'Events deleted successfully'
      flag = true
    end
    flag ? true : false
  end
  # calendar view

  def self.view

    $total_events.each do |key, value|
      p "#{key}  =>  #{value.size} event"
    end
  end
end
