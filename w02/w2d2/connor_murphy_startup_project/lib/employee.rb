class Employee
    attr_reader :name, :title, :earnings

    def initialize(name, title)
        @name = name
        @title = title
        @earnings = 0
    end

    def pay(amt)
        @earnings += amt
    end
end