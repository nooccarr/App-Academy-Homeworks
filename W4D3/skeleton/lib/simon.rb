require "byebug"
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over == true
      take_turn
    end

    puts game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if game_over == false
      @sequence_length += 1
      puts round_success_message
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts color
      # code for showing and resetting screen goes here
    end
  end

  def require_sequence
    input = gets.chomp.split
    seq.each_with_index do |color, i|
      unless color == input[i]
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    "Round success!"
  end

  def game_over_message
    "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
