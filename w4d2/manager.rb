require_relative 'employee'

class Manager < Employee
    attr_reader :employees
    def initialize(name, salary, title, boss)
        super
        @employees = []
    end

    def add_employee(employee)
        @employees << employee
    end

    # def add_manager(name, salary, title, boss)
    #     @employees << Manager.new(name, salary, title, boss)
    # end

    def bonus(multiplier)
      total = []

        @employees.each do |employee|
            if employee.is_a?(Manager)
                total << employee.salary
                total << employee.bonus(1)
            else    
                total << employee.salary
            end
        end
        total.flatten.sum * multiplier
    end

end

#"Ned", 1000000, 'Founder', nil
#"Darren", 78000, 'TA Manager', "Ned"
#"Shawna", 12000, 'TA', 'Darren'
#"David", 10000, 'TA', "Darren"