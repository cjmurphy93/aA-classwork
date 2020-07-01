require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name, input_hash)
        @name = name
        @rooms = {}
        input_hash.each do |room_name, c|
            @rooms[room_name] = Room.new(c)
        end

    end

    def name
        @name.split.map(&:capitalize).join(" ")
    end

    def room_exists?(room_name)
        @rooms.include?(room_name)
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            print "sorry, room does not exist"
        elsif @rooms[room_name].add_occupant(person)
            print "check in successful"
        else
            print "sorry, room is full"
        end
    end

    def has_vacancy?
        @rooms.each do |room_name, room_instance|
            if !@rooms[room_name].full?
                return true
            end
        end

        false
    end

    def list_rooms
        @rooms.each do |room_name, room_instance|
            puts room_name + " " + @rooms[room_name].available_space.to_s
        end
    end
  
end
