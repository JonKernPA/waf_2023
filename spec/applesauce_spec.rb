require 'apple_sauce'

RSpec.describe AppleSauce do

  it 'starts in not started mode' do
    app = AppleSauce.new
    expect(app.started).to be_falsey
  end

  it 'should be startable' do
    app = AppleSauce.new
    app.start
    expect(app.started).to be_truthy
  end

  it 'should be stoppable' do
    app = AppleSauce.new
    app.stop
    expect(app.started).to be_falsey
  end

  it 'should allow specifying grid size' do
    width = 4
    height = 3
    app = AppleSauce.new(width: width, height: height)
    expect(app.width).to eql(width)
    expect(app.height).to eql(height)
  end

  it 'should show the grid' do
    app = AppleSauce.new(width: 5, height: 5)
    app.alive(1,3)
    app.alive(3,1)
    board = <<~BRD
      | | | | | |
      | | | |*| |
      | | | | | |
      | |*| | | |
      | | | | | |
    BRD

    expect(app.show_board).to eql(board)
  end

  it '#alive' do
    app = AppleSauce.new(width: 5, height: 5)
    app.alive(3,1)
    expect(app.grid[3][1]).to be_truthy
  end

  describe '#generation' do
    it '#generation' do
      app = AppleSauce.new(width: 5, height: 5)
      expect { app.generation }.to change{app.tick}.from(0).to(1)
    end

    it '#clone_grid' do
      app = AppleSauce.new(width: 3, height: 3)
      app.alive(1,1)
      app.clone_grid
      expect(app.next_gen[1][1]).to eql(AppleSauce::ALIVE)
    end

    # X--   ---
    # -X-   ---
    # ---   ---
    it 'should count neighbors' do
      app = AppleSauce.new(width: 3, height: 3)
      app.alive(0,0)
      app.alive(1,1)
      expect(app.neighbors(0,0)).to eql(1)
      expect(app.neighbors(0,1)).to eql(2)
      expect(app.neighbors(1,0)).to eql(2)
      expect(app.neighbors(1,1)).to eql(1)
    end


    describe 'Conways Rules' do

      describe 'RULE 1: Any live cell with fewer than two live neighbours dies, as if caused by underpopulation' do
        # ---   ---
        # -X-   ---
        # ---   ---
        it 'should kill a cell with 0 neighbors' do
          app = AppleSauce.new(width: 3, height: 3)
          app.alive(1,1)

          app.generation

          expect(app.grid[1][1]).to eql(AppleSauce::DEAD)
        end

        # X--   ---
        # -X-   ---
        # ---   ---
        it 'should kill a cell with 1 neighbors' do
          app = AppleSauce.new(width: 3, height: 3)
          app.alive(0,0)
          app.alive(1,1)

          app.generation

          expect(app.grid[0][0]).to eql(AppleSauce::DEAD)
          expect(app.grid[1][1]).to eql(AppleSauce::DEAD)
        end


      end

      describe 'RULE 2: Any live cell with two or three live neighbours lives on to the next generation.' do
        # X--   ---
        # -X-   -X-
        # --X   ---
        it 'live with 2 neighbors' do
          app = AppleSauce.new(width: 3, height: 3)
          app.alive(0,0)
          app.alive(1,1)
          app.alive(2,2)

          app.generation

          expect(app.grid[0][0]).to eql(AppleSauce::DEAD)
          expect(app.grid[1][1]).to eql(AppleSauce::ALIVE)
          expect(app.grid[2][2]).to eql(AppleSauce::DEAD)
        end

        # X-X   ---
        # ---   -X-
        # --X   ---
        it 'should come to life with exactly 3 neighbors' do
          app = AppleSauce.new(width: 3, height: 3)
          app.alive(0,0)
          app.alive(0,2)
          app.alive(2,2)

          app.generation

          expect(app.grid[0][0]).to eql(AppleSauce::DEAD)
          expect(app.grid[1][1]).to eql(AppleSauce::ALIVE)
          expect(app.grid[2][2]).to eql(AppleSauce::DEAD)
        end


      end

      describe 'RULE 3: Any live cell with more than three live neighbours dies, as if by overpopulation.' do
        # X-X   ---
        # -X-   ---
        # X-X   ---
        it 'should die with > 3 neighbors' do
          app = AppleSauce.new(width: 3, height: 3)
          app.alive(0,0)
          app.alive(0,2)
          app.alive(1,1)
          app.alive(2,0)
          app.alive(2,2)

          app.generation

          expect(app.grid[1][1]).to eql(AppleSauce::DEAD)
        end

      end

      describe 'RULE 4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction' do
        # X-X   ---
        # ---   -X-
        # --X   ---
        it 'should be born with 3 neighbors' do
          app = AppleSauce.new(width: 3, height: 3)
          app.alive(0,0)
          app.alive(2,0)
          app.alive(2,2)

          app.generation

          expect(app.grid[1][1]).to eql(AppleSauce::ALIVE)
        end

      end

    end

  end

end
