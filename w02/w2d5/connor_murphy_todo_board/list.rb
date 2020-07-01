require_relative 'item'
require 'byebug'
class List
attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        return false if idx.to_i < 0 || idx.to_i > self.size
        true
    end

    def swap(index1, index2)
        idx1 = index1.to_i
        idx2 = index2.to_i
        return false if !self.valid_index?(idx1) || !self.valid_index?(idx2)
        @items[idx1],@items[idx2] = @items[idx2],@items[idx1]
        true
    end

    def [](idx)
        return nil if !self.valid_index?(idx.to_i)
        @items[idx.to_i]
    end

    def priority
        @items.first
    end

    def print 
        
        puts @label 
        puts '------------------------------------------'
        @items.each do |item|
        checkmark = " "
        checkmark = "✓" if item.done
            puts "#{@items.index(item)} | #{item.title} | #{item.deadline} | [ #{checkmark} ]"
        puts '------------------------------------------'
        end
    end

    def print_full_item(index)
        puts "#{index} | #{self[index].title} | #{self[index].deadline} | #{self[index].done} "
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount = 1)
        return false if !self.valid_index?(index)
        amount = amount.to_i
        first_index = index.to_i
        second_index = index.to_i - 1
        while amount > 0 || second_index > 0
            self.swap(first_index, second_index)
            first_index -= 1
            second_index -=1
            amount -=1
        end
        true
    end

    def down(index, amount = 1)
        return false if !self.valid_index?(index)
        amount = amount.to_i
        first_index = index.to_i
        second_index = index.to_i + 1
        while amount > 0 && second_index < @items.length
            self.swap(first_index, second_index)
            first_index += 1
            second_index += 1
            amount -=1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        self[index.to_i].toggle
    end

    def remove_item(index)
        index = index.to_i
        return false if !self.valid_index?(index)
        @items.delete_at(index)
    end

    def purge
        @items = @items.select! { |item| !item.done }
    end
end

# my_list = List.new('Groceries')
# my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
# my_list.add_item('candy', '2019-09-31', '4 bags should be enough')
# my_list.add_item('shampoo', '2019-10-24')
# my_list.add_item('toothpaste','2019-10-25')
# my_list.print
# my_list.sort_by_date!
# my_list.print

