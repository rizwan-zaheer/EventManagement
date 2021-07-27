require_relative 'event'
require_relative 'helper'
require 'pry'
# Calendar class
class Calendar

  def initialize(total_events)
    @total_events = total_events
  end
  # add event

  def add(user_input)

    date, title, desc = user_input
    flag = false
    if @total_events.key?(date)
      new_event = Event.new(title, desc)
      @total_events[date].push new_event
      flag = true
    end

    unless flag
      new_event = Event.new(title, desc)
      @total_events[date] = [new_event]
    end
    p @total_events
    true
  end
  # modify event
  def modify(user_input)

    date, title, new_title, new_desc = user_input

    if @total_events.key?(date)
      
      @total_events[date].each do |event|
        next unless event.title == title

        event.title = new_title
        event.desc = new_desc
        p @total_events
        return true
      end
    end
    false
  end
  # single event on date

  def single_event(user_input)

    date, title = user_input
    if @total_events.key?(date)

      @total_events[date].each do |event|
        next unless event.title == title

        @total_events[date].pop
        p @total_events
        return true
      end
    end
    false
  end
  # all events on date
  def all_events_on_Date(user_input)

    date = user_input
    if @total_events.key?(date)
      @total_events.tap { |events| events.delete(date) }
      p @total_events
      return true
    end
    false
  end
  # all events on month
  def all_events_on_month(month)

    flag = false
    # there we have to iterate over hash key values because we want to delete all events on given month
    @total_events.each do |key, _value|
      _key_day, key_month, _key_year = key.split('-')
      next unless key_month == month

      @total_events.tap { |events| events.delete(key) }
      flag = true
    end
    p @total_events
    flag
  end
  # calendar view

  def view

    @total_events.each do |key, value|
      p "#{key}  =>  #{value.size} event"
    end
  end
end
