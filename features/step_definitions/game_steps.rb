Given(/^The application is configured$/) do
  @app = AppleSauce.new
end

When(/^The Start button is pressed$/) do
  @app.start
end

Then(/^The Game will Start$/) do
  expect(@app.started).to be_truthy
end

Then(/^The Start button will = Stop$/) do
  pending
end

And(/^the application is started$/) do
  @app.start
end

When(/^The Stop button is pressed$/) do
  @app.stop
end

Then(/^The Game will be stopped$/) do
  expect(@app.started).to be_falsey
end

Given(/^The application is configured (\d+) x (\d+)$/) do |width, height|
  @app = AppleSauce.new(width: width, height: height)
end

Then(/^The Game grid will be shown$/) do
  board = <<~BRD
      | | | | |
      | | | | |
      | | | | |
  BRD
  expect(@app.show_board).to eql(board)
end

And(/^the cells are initialized as follows$/) do |table|
  # table is a table.hashes.keys # => [:a, :b, :c, :d]
  table.raw.each_with_index do |row, r|
    row.each_with_index do |value, c |
      # puts "Cell[#{r},#{c}] = '#{value == '*' ? true : false}'"
      if value == 'x'
        @app.alive(r,c)
      end
    end
  end
end

Then(/^The Game grid should be this after (\d+) generation$/) do |gen, table|
  puts 'STARTING STATE-----------------'
  puts @app.show_board
  puts '- - - - - - - - - - - - - - - -'
  @app.generation
  puts 'GEN 1 -----------------'
  puts @app.show_board

  puts 'TEST -----------------'
  board = []
  table.raw.each_with_index do |row, r|
    text = "|"
    row.each_with_index do |value, c |
      text += "#{value == '*' ? '*' : ' '}|"
    end
    board << text
  end
  puts board.join("\n")

  expect(@app.show_board.rstrip).to eql((board.join("\n")))
end
