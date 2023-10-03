# frozen_string_literal: true

class AppleSauce
  attr_reader :width, :height, :grid

  def initialize(width: 10, height: 10)
    @width = width.to_i
    @height = height.to_i
    @grid = initialize_row(height)
    @grid.map! { initialize_row(width) }
  end

  def started
    @started
  end

  def start
    @started = true
  end

  def stop
    @started = false
  end

  def show_board
    board = @grid.map do |row|
      txt = "|"
      txt += row.join('|')
    end.join("|\n")
    board += "|\n"
  end

  private

  def initialize_row(size)
    row = Array.new(size)
    row.fill { |cell| ' ' }
  end
end
