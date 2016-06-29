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
  def initialize(input_options)
    super
    @employees = input_options[:employees]
  end

  def send_report
    puts "Sending email..."
    # write code to send email report
    puts "Email sent!"
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

employee1 = Employee.new({first_name: "Majora", :last_name => "Carter", salary: 80000, active: true})
employee2 = Employee.new(salary: 70000, first_name: "Danilo", last_name: "Campos", active: true)
employee1.print_info
employee2.print_info

manager = Manager.new(
  first_name: "Saron",
  last_name: "Yitbarek",
  salary: 100000,
  active: true,
  employees: [employee1, employee2]
)
manager.print_info
# manager.send_report
manager.give_all_raises

employee1.print_info

manager.fire_all_employees
p employee1.active
