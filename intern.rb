require './employee.rb'
require './email_reporter.rb'

class Intern < Employee
  include EmailReporter
end
