require 'date'
# class
module Helper
def validate_date(date)

  begin
    Date.strptime(date, '%d-%m-%Y')
  rescue StandardError
    false
  end
end
  # validate string

  def check_string (string)

    string.scan(/\D/).empty?
  end
end
