require './employee.rb'
require './email_reporter.rb'

module ACLTC
  class Intern < Employee
    include EmailReporter
  end
end