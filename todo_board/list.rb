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
        @items.size
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

end