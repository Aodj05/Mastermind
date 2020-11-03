require_relative 'color'

class Player
    include Color
    attr_reader :name, :code
    
    def intialize(name)
        @name = name
    end

    def check_guess(guess)
        response = []
        guess.each_with_index do |color, index|
            legal_choice = false
            until legal_choice
                puts "You guessed: #{code}"
                puts "1. You got it\n2. Right color\n3. Wrong"
                puts "Color \##{index+1}: #{color} of #{guess}"
                puts choice = gets.chomp
                if %w[1 2 3].include? choice
                    response.push response_choice choice.to_i unless choice == '3'
                    legal_choice = true
                end
            end
        end
        response
    end

    def create_code
        @code = []
        4.times do |number|
            give_color_options
            legal_input = false
            until legal_input
                puts
                print "Enter color #{number + 1}:"
                color = gets.chomp.downcase
                if COLOR_LIST.include? color
                    @code.push color
                    legal_input = true
                end
            end
        end
        @code
    end

    def make_guess
        guess = []
        4.times do |number|
            legal_input = false
            until legal_input
                print "Enter quess #{number + 1}: "
                input = gets.chomp.downcase
                if COLOR_LIST.include? input
                    guess.push input
                    legal_input = true
                end
            end
        end
        guess
    end

    private

    def response_choice(choice)
        case choice
        when 1 then 'Exact match'
        when 2 then 'Correct color'
        end
    end
end