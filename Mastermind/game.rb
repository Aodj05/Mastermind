require_relative 'player'
require_relative 'computer'
require_relative 'color'

class Game
    include Color
    attr_reader :player, :computer
    NUMBER_ROUNDS = 12
    
    def initialize
        print 'Enter player name: '
        @player = Player.new 
        gets.chomp
        @computer = Computer.new
    end
    
    def query_mastermind
        legal_answer = false
        input = ''
        until legal_answer
            print "Does #{player.name} want to be the Codemaster? (Y/N)"
            input = gets.chomp.downcase
            legal_answer = true if input == 'y'|| input == 'n'
        end
        input == 'n' ? play_computer_codemaster : play_player_codemaster
    end

    private

    def play_player_codemaster
        code = player.create_code
        NUMBER_ROUNDS.times do |number|
            puts "Round #{number + 1} of #{NUMBER_ROUNDS}"
            guess = computer.make_guess
            puts "Computer guessed: #{guess}"
            response = player.check_guess(guess)
            puts "Actual: #{response}"
            if response == win_condition
                puts "Computer wins"
                break
            end
            print "Computer did not get the code" if number == 11
        end
    end

    def play_computer_codemaster
        NUMBER_ROUNDS.times do |number|
            2.times { puts } if number > 0
            give_color_options
            puts "Round #{number + 1} of #{NUMBER_ROUNDS}"
            guess = player.make_guess
            response = computer.check_guess(guess)
            print "Your guess: #{guess}\n"
            print "Actual: #{response}\n" unless response == win_condition
            if response == win_condition
                declare_win
                break
            end
            print "#{player.name} did not get the code" if number == 11
        end
    end
    
    def win_condition
        win_condition = Array.new 4, 'Correct'
    end

    def declare_win
        print "#{player.name} got the code"
    end
end