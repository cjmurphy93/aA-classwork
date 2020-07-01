require_relative "employee"

class Startup
attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.include?(title)
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise
        end
    end

    def size
        return @employees.length
    end

    def pay_employee(emp)
        if self.funding >= @salaries[emp.title]
        emp.pay(@salaries[emp.title])
        @funding -= @salaries[emp.title]
        else
            raise
        end
    end

    def payday
        @employees.each {|employee| self.pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end

        sum.to_f / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        @salaries = other_startup.salaries.merge(@salaries)
        @employees += other_startup.employees
        other_startup.close
    end
end

