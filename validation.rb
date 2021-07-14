require 'date'
# class
class Validation
  def self.validate_date(date)
    begin
      Date.strptime(date, '%d-%m-%d')
      true
    rescue StandardError
      false
    end
  end
  # validate string

  def self.check_string(string)
    string.scan(/\D/).empty?
  end
end
