module EmailReporter
  def send_report
    puts "Sending email..."
    # write code to send email report
    puts "Email sent!"
  end

  def receive_report
    puts "Getting report..."
    # write code to get report
    puts "Report received!"
  end
end

class Employee
  attr_reader :first_name, :last_name
  attr_accessor :active

  def initialize(input_options)
    @first_name = input_options[:first_name]
    @last_name = input_options[:last_name]
    @salary = input_options[:salary]
    @active = input_options[:active]
  end

  def print_info
    puts "#{@first_name} #{@last_name} makes #{@salary} a year."
  end

  def give_annual_raise
    @salary = 1.05 * @salary
  end
end

class Manager < Employee
  include EmailReporter

  def initialize(input_options)
    super
    @employees = input_options[:employees]
  end

  def print_info
    super
    puts "Hello! I'm a manager!"
  end

  def give_all_raises
    @employees.each do |employee|
      employee.give_annual_raise
    end
  end

  def fire_all_employees
    @employees.each do |employee|
      employee.active = false
    end
  end
end

class Intern < Employee
  include EmailReporter
end

intern = Intern.new(first_name: "Adrienne", last_name: "Lowe", salary: 40000, active: true)
intern.print_info
intern.send_report
intern.receive_report
