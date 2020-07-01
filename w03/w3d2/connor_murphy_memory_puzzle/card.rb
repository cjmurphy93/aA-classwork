class Card
    attr_reader :face_up
    def initialize(value)
        @value = value
        @face_up = false
    end

    def hide
        @face_up =false
    end

    def reveal
        @face_up = true
    end

    def value
        @face_up == true ? @value : nil
    end

    def ==(value)
        @value == value.value
    end

end