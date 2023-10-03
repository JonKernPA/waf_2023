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
    board = <<~BRD
        | | | | | |
        | | | | | |
        | | | | | |
        | | | | | |
        | | | | | |
    BRD

    expect(app.show_board).to eql(board)
  end

end
