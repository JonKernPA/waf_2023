# frozen_string_literal: true

class AppleSauce
  attr_reader :width, :height, :grid, :next_gen, :tick

  ALIVE = '*'
  DEAD = ' '

  def initialize(width: 10, height: 10)
    @width = width.to_i
    @height = height.to_i
    # Create the initial vector of HEIGHT length
    @grid = initialize_vector(height)
    # Each row is a vector of WIDTH length
    @grid.map! { initialize_vector(width) }
    # puts @grid.inspect
    # puts "INIT"
    @tick = 0
  end

  def clone_grid
    @next_gen = initialize_vector(height)
    @next_gen.map! { initialize_vector(width) }
    @height.times do |r|
      @width.times do |c|
        @next_gen[r][c] = ALIVE if @grid[r][c] == ALIVE
      end
    end
    @next_gen
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
      txt += row.map{|c| c }.join('|')
    end.join("|\n")
    board += "|\n"
  end

  def alive(r,c)
    @grid[r][c] = ALIVE
  end

  def dead(r,c)
    @grid[r][c] = DEAD
  end

  def neighbors(r, c)
    c_max = @width - 1
    r_max = @height - 1
    neighbors = 0
    # Top-left
    if r > 0 && c > 0
      if @grid[r-1][c-1] == ALIVE
        neighbors += 1
      end
    end
    # Top-center
    if r > 0
      if @grid[r-1][c] == ALIVE
        neighbors += 1
      end
    end
    # Top-right
    if r > 0 && c < c_max
      if @grid[r-1][c+1] == ALIVE
        neighbors += 1
      end
    end
    # Middle-left
    if c > 0
      if @grid[r][c-1] == ALIVE
        neighbors += 1
      end
    end
    # Middle-right
    if c < c_max
      if @grid[r][c+1] == ALIVE
        neighbors += 1
      end
    end
    # Bottom-left
    if r < r_max && c > 0
      if @grid[r+1][c-1] == ALIVE
        neighbors += 1
      end
    end
    # Bottom-middle
    if r < r_max
      if @grid[r+1][c] == ALIVE
        neighbors += 1
      end
    end
    # Bottom-right
    if r < r_max && c < c_max
      if @grid[r+1][c+1] == ALIVE
        neighbors += 1
      end
    end
    # puts 'N = ' + neighbors.to_s
    neighbors
  end

  def num_alive
    num = 0
    @grid.each do |row|
      row.each do |cell|
        num += 1 if cell == ALIVE
      end
    end
    num

  end

  def generation
    clone_grid
    @tick += 1

    # now run each cell through the rules...
    @height.times do |r|
      n_array = []
      @width.times do |c|
        neighbors = neighbors(r, c)
        n_array << neighbors
        # puts "Cell[#{r},#{c}] = '#{@grid[r][c]}' N=#{neighbors}"
        if @grid[r][c] == ALIVE
          # 1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation
          if neighbors < 2
            # puts "Cell[#{r},#{c}] dies"
            @next_gen[r][c] = DEAD
            # dead(r,c)
          end
          # 2. Any live cell with two or three live neighbours lives on to the next generation.
          if neighbors == 2 || neighbors == 3
            # puts "Cell[#{r},#{c}] lives"
            @next_gen[r][c] = ALIVE
            # alive(r,c)
          end

          # 3. Any live cell with more than three live neighbours dies, as if by overpopulation.
          if neighbors > 3
            # puts "Cell[#{r},#{c}] Dies"
            @next_gen[r][c] = DEAD
          end

        else
          # 4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
          if neighbors == 3
            # puts "Cell[#{r},#{c}] Dies"
            @next_gen[r][c] = ALIVE
          end
        end
      end
      # puts n_array.join('|')
    end



    # puts next_grid.inspect
    # puts 'END'
    @grid = @next_gen
  end

  # private

  def initialize_vector(size)
    row = Array.new(size)
    row.fill { |i| ' ' }
  end
end
