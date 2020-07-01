require_relative 'dictionary'
require_relative 'player'

class Game

        def initialize(*names)
            @players = names.map {|name| Player.new(name)}
            @fragment = ""
            @dictionary = MY_DICTIONARY.to_set
            
        end

        def current_player
            @players[0]
        end

        def previous_player
            @players[-1] 
        end

        def next_player!
            @players.rotate!
        end

        def take_turn(player)
            input = player.guess
            until player.alert_invalid_guess(input)
                input = player.guess
            end
                input
        end



end