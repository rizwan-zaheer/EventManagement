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

    p 'Enter title name to change:'
    title = gets.chomp
    return false if check_string(title)

    p 'Enter NewTitle:'
    new_title = gets.chomp
    return false if check_string(new_title)

    p 'Enter NewDesc'
    new_desc = gets.chomp
    return false if check_string(new_desc)

    [date, title, new_title, new_desc]
  end
  # input for delete
  def delete_events(choice)
    
    case choice
    when '1'
      p 'Enter date:'
      date = gets.chomp
      return false unless validate_date(date)

      p 'Enter title:'
      title = gets.chomp
      return false if check_string(title)

      [date, title]
    when '2'
      p 'Enter date:'
      date = gets.chomp
      return false unless validate_date(date)

      date
    when '3'
      p 'Enter month:'
      month = gets.chomp

      month
    else
      p 'Select right option'
    end
  end
end
