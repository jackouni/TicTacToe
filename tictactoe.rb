board = [              # Positions available on the board 
    "A1", "B1", "C1",
    "A2", "B2", "C2",
    "A3", "B3", "C3"
]

win_positions = [       # Possible Winning Positions
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
    @@number_of_players = 0
    def self.get_number_of_players
        return @@number_of_players
    end 

    #private

    def initialize(name, symbol)
        @name = name
        @symbol = symbol.upcase
        @board_occupied = []
        @turn = false
        @@number_of_players += 1
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
                puts "Positions you occupy: #{@board_occupied}"
                break
            else 
                puts "Sorry, that's not a position on the board."
                puts "Please select/type a position from the options available:\n #{board}"
            end  
        end 
    end 

end 

player1 = Player.new("Jay", "x")
player2 = Player.new("Joe", "y")

player1.place_piece(board)
