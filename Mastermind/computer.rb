require_relative 'color'

class Computer
    include Color
    attr_reader :code

    def initialize
        @code = rand_color_gen
    end

    def make_guess
        rand_color_gen
    end

    def check_guess(guess_array)
        response = []
        guess_array.each_with_index do |color, index|
            if color == code[index]
                response.push 'correct'
            elsif code.include? color
                response.push 'right color'
            end
        end
        response
    end

    private

    def rand_color_gen
        color_array = Array.new 4
        color_array.each_index do |index|
            color_nonexistent = false
            until color_nonexistent
                color = create_rand_color
                unless color_array.include? color
                    color_nonexistent = true
                    color_array[index] = color
                end
            end
            color_array
        end
    end
end