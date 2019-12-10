require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times {@cups[i] << :stone}
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0, 12)
      raise "Invalid starting cup" 
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end



  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]                 # number of stones
    @cups[start_pos] = []                     # empties cup

    until stones.empty?                       
      start_pos += 1
      start_pos = 0 if start_pos > 13         

      if start_pos == 6                       
        if current_player_name == @name1
          @cups[6] << stones.pop 
        end
      elsif start_pos == 13 
        if current_player_name == @name2
          @cups[13] << stones.pop 
        end
      else
        @cups[start_pos] << stones.pop
      end
    end

    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13  # get another turn
      :prompt
    elsif @cups[ending_cup_idx].length == 1         # last stone placed
      :switch
    else
      ending_cup_idx                                # repeat make move
    end
  end


  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}     
  end

  def winner
    player1_point = @cups[6].length
    player2_point = @cups[13].length
    
    case player1_point <=> player2_point
    when 1
      @name1
    when 0
      :draw
    when -1
      @name2
    end
  end
end
