require 'apple_sauce'

RSpec.describe AppleSauce do

  it 'should have a 2D grid' do
    app = AppleSauce.new
    expect(app.grid.size).to eql(20)
  end
  it 'should have a height grid' do
    app = AppleSauce.new
    expect(app.grid[0].size).to eql(20)
  end

  it 'starts in not started mode' do
    app = AppleSauce.new
    expect(app.started).to be_falsey
  end

  it 'should be startable' do
    app = AppleSauce.new
    app.start
    expect(app.started).to be_truthy
  end
end
