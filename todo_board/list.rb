require "./item.rb"


class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")   

        # if Item.new(title, deadline, description) #NOT SURE ABOUT THIS CONDITION
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            true
        else
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index.between?(0, self.size)
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1],@items[index_2] = @items[index_2],@items[index_1]
            true
        else
            false
        end
    end

    def [](index)
        if !valid_index?(index)
            nil
        else
            @items[index]
        end
    end

    def priority
        @items.first
    end

    def print
        puts "_" * 50
        puts " " * 20 + self.label.upcase
        puts "_" * 50
        puts "#{'Index'.ljust(5)} | #{'Item'.ljust(20)} | #{'Deadline'.ljust(10)}"
        puts "-" * 50
        @items.each_with_index do |item, i|
            puts "#{i.to_s.ljust(5)} | #{item.title.ljust(20)} | #{item.deadline.ljust(10)}"
        end
        puts "_" * 50
    end

    def print_full_item(index)
        if self.valid_index?(index)
            puts "-" * 42
            puts "#{item.title.ljust(42/2)}#{item.deadline.rjust(42/2)}"
            puts item.description
            puts "-" * 42
        end
    end

    def print_priority
        print_full_item(self.priority)
    end

    def up(index, amount = 1)
        if !self.valid_index?(index)
            false
        else
            while amount > 0 && index != 0
                swap(index, index - 1)
                index -= 1
                amount -= 1
            end
            true
        end
    end

    def down(index, amount = 1)
        if !self.valid_index?(index)
            false
        else
            while amount > 0 && index != size - 1
                swap(index, index + 1)
                index += 1
                amount -= 1
            end
            true
        end
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end



end