require_relative 'helper'
# module
module Input
  include Helper
  # input for add event
  def input_for_add
    p 'Enter date:'
    date = gets.chomp
    return false unless validate_date(date)

    p 'Enter Title:'
    title = gets.chomp
    return false if check_string(title)

    p 'Enter Desc:'
    desc = gets.chomp
    return false if check_string(desc)

    [date, title, desc]
  end
  # input for modify event
  def input_for_modify

    p 'Enter date on which you modify event'
    date = gets.chomp
    return false unless validate_date(date)

    flag = false
    $total_events.each_pair do |key, _value|
      next unless key == date

      flag = true
    end
    if flag
      p 'Enter title name to change:'
      title = gets.chomp
      return false if check_string(title)

      p 'Enter NewTitle:'
      new_title = gets.chomp
      return false if check_string(new_title)

      p 'Enter NewDesc'
      new_desc = gets.chomp
      return false if check_string(new_desc)

      return [date, title, new_title, new_desc]
    end
    false
  end
  # input for delete
  def delete_events

    p '1:Single event on a date'
    p '2:All events on a date'
    p '3:All events on a month'
    choice = gets.chomp
    case choice
    when '1'
      p 'Enter date:'
      date = gets.chomp
      return false unless validate_date(date)

      p 'Enter title:'
      title = gets.chomp
      return false if check_string(title)
      return true if Calendar.single_event(date, title)
    when '2'
      p 'Enter date:'
      date = gets.chomp
      return false unless validate_date(date)
      return true if Calendar.all_events_on_Date(date)
    when '3'
      p 'Enter month:'
      month = gets.chomp
      return true if Calendar.all_events_on_month(month)
    else
      p 'Select right option'
    end
  end
end
