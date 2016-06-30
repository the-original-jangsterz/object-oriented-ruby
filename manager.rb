require './employee.rb'
require './email_reporter.rb'

module ACLTC
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
end
