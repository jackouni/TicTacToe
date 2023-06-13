board = [             
    "A1", "B1", "C1",
    "A2", "B2", "C2",
    "A3", "B3", "C3"
]

win_positions = [ 
    ["A1", "B1", "C1"],
    ["A2", "B2", "C2"],
    ["A3", "B3", "C3"],
    ["A1", "B2", "C3"],
    ["A3", "B2", "C1"],
    ["A1", "A2", "A3"],
    ["B1", "B2", "B3"],
    ["C1", "C2", "C3"]
]

class Player

    def initialize(name, symbol)
        @name = name
        @symbol = symbol.upcase
        @board_occupied = []
    end  

    def win?(win_positions) # Checks to see if a player has a winning position
        win_positions.each do |win_position|
            board_occupied_matches = (win_position & @board_occupied).sort
            if board_occupied_matches == win_position
                puts "#{@name} has a win with positions: #{board_occupied_matches.flatten}"
                puts "#{@name} wins the game!"
                return true 
            end 
        end 
    end 

    def place_piece(board) # Behaviour that allows players to place their pieces
        puts "Please enter a position that is available on the board!"
        puts "Options include: #{board}"
        loop do
            position = gets.chomp.to_s.upcase
            position_index = board.index(position)
            if board.include?(position)
                board.delete(position)
                @board_occupied.push(position)
                puts "Current board: #{board}"
                puts "Positions #{@name} occupies: #{@board_occupied}"
                break
            else 
                puts "Sorry, that's not a position on the board."
                puts "Please select/type a position from the options available:\n #{board}"
            end  
        end 
    end
    def forfeit # Behaviour that allows players to forfeit the game
    end 
end 

def input_p1_name
    puts "Player 1, enter the name you want to be referred by:"
    user_name = gets.chomp.to_s.capitalize
    return user_name
end 

def input_p2_name
    puts "Player 2, enter the name you want to be referred by:"
    user_name = gets.chomp.to_s.capitalize
    return user_name
end 

# --- GAMEPLAY --- #

player1 = Player.new(input_p1_name(), "x")
player2 = Player.new(input_p2_name(), "y")
players = [player1, player2]
players[0].place_piece(board)
players[0].place_piece(board)
players[0].place_piece(board)
players[0].place_piece(board)
players[0].place_piece(board)
player1.win?(win_positions)