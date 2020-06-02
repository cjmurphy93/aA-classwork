class Employee
attr_reader :name, :title, :salary, :boss
    def initialize(name, salary, title, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss

    end

        def bonus(multiplier)
            @salary * multiplier
        end


end