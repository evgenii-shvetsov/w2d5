class Item
    def self.valid_date?(date_string)
        date_splitted = date_string.split("-")
        year = date_splitted[0]
        month = date_splitted[1].to_i
        day = date_splitted[2].to_i
        #conditions
        year.length == 4 && month.between?(1,12) && day.between?(1,31)
    end

    attr_accessor :title, :description

    def initialize(title, deadline, description)
        @title = title
        @description = description

        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "invalide date"
        end  
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "invalide date"
        end  
    end



end